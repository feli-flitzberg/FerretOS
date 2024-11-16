# report-card.awk -- Test summary tool
# Copyright (C) 2018, 2021 Free Software Foundation, Inc.
#
# This file is part of DejaGnu.
#
# DejaGnu is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# DejaGnu is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with DejaGnu; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.

# This file was written by Jacob Bachmeyer.

# ##help
# #Usage: dejagnu report card [ OPTION | TOOL | FILE ]...
# #Usage: dejagnu report-card [ OPTION | TOOL | FILE ]...
# #	--verbose, -v		Emit additional messages
# ##end

# Arrays storing lists in this program store items in numbered keys, with a
# count in the "C" key, similar to Awk's ARGV/ARGC.

# The Tools array stores a list of tools in 1..N.

# The Passes array stores a global list of passes seen, a per-tool list of
# passes seen, and a global index of passes seen if DejaGnu's multipass
# support is used.
# Key prefixes:
#  ""		-- global list:    1..N; "C"
#  "t", <tool>	-- per-tool list:  1..N; "C"
# Key patterns:
#  "p", <pass>	-- count of tools using <pass>

# The Totals array stores counts of test results, indexed by tool and pass.
# A summarization step adds per-tool, per-pass, and grand totals.
# Key patterns:
#  "tp", <Tool>, <Pass>, <result>
#  "t", <Tool>, <result>
#  "p", <Pass>, <result>
#  <result>

##
## Get list of files to scan

BEGIN {
    Tools["C"] = 1
    Passes["", "C"] = 1
    ToolWidth = 0
    PassWidth = 0
    Verbose = 0
    # remove arguments from ARGV
    for (i = 1; i < ARGC; i++) {
	if (ARGV[i] ~ /^-/) {
	    if (ARGV[i] ~ /^--?v(erb.*)?$/)
		Verbose++
	    else if (ARGV[i] == "--")
		break
	    delete ARGV[i]
	}
    }
    if (ARGV[i] == "--")
	delete ARGV[i]
    if (Verbose) print "Verbose level is "Verbose
    # adjust filenames in ARGV
    FileCount = 0
    for (i = 1; i < ARGC; i++) {
	if (i in ARGV) FileCount++
	else continue
	if (ARGV[i] ~ /\.sum$/) continue
	else if (ARGV[i] ~ /\.log$/) sub(/\.log$/, ".sum", ARGV[i])
	else if (ARGV[i] ~/\.$/) sub(/\.$/, ".sum", ARGV[i])
	else ARGV[i] = (ARGV[i]".sum")
    }
    if (FileCount == 0) {
	cmd_ls_files = "ls -1 *.sum"
	while (cmd_ls_files | getline File) {
	    FileCount++
	    ARGV[ARGC++] = File
	}
	close(cmd_ls_files)
    }
    if (Verbose > 2) {
	print "Reading "FileCount" file(s)"
	for (i = 1; i < ARGC; i++)
	    if (i in ARGV)
		print "  "ARGV[i]
    }
}

##
## Read files and collect data

FNR == 1 {
    if (Verbose)
	print "Reading `"FILENAME"' ..."
    Pass = ""
    Tool = File = FILENAME
    sub(/\.sum$/, "", Tool)
    if (length(Tool) > ToolWidth)
	ToolWidth = length(Tool)
    Tools[Tools["C"]++] = Tool
    Passes["t", Tool, "C"] = 1
    Passes["t", Tool, 1] = "" # will be overwritten if multipass is used
}

/^Running pass `[^']*' .../ {
    Pass = $3
    sub(/^`/, "", Pass)
    sub(/'$/, "", Pass)
    if (("p", Pass) in Passes)
	Passes["p", Pass]++
    else {
	if (length(Pass) > PassWidth)
	    PassWidth = length(Pass)
	Passes["", Passes["", "C"]++] = Pass
	Passes["p", Pass] = 1
    }
    Passes["t", Tool, Passes["t", Tool, "C"]++] = Pass
}

$1 ~ /:$/ { sub(/:$/, "", $1); Totals["tp", Tool, Pass, $1]++ }

##
## Compute totals

END {
    $0 = ("PASS FAIL KPASS KFAIL XPASS XFAIL UNSUPPORTED UNRESOLVED UNTESTED")
    for (i = 1; i in Tools; i++)
	for (j = 1; ("t", Tools[i], j) in Passes; j++)
	    for (k = 1; k <= NF; k++) {
		Totals[$k]						\
		    += Totals["tp", Tools[i], Passes["t", Tools[i], j], $k]
		Totals["t", Tools[i], $k]				\
		    += Totals["tp", Tools[i], Passes["t", Tools[i], j], $k]
		Totals["p", Passes["t", Tools[i], j], $k]		\
		    += Totals["tp", Tools[i], Passes["t", Tools[i], j], $k]
	    }
}

##
## Compute total name column width

END {
    if (Passes["", "C"] > 1)
	NameWidth = ToolWidth + 3 + PassWidth
    else
	NameWidth = ToolWidth
}

##
## Emit header

END {
    printf "%*s   __________________________________________________\n", \
	NameWidth, ""
    printf "%*s  /  %6s %6s %6s %6s %6s %6s %6s\n", NameWidth, "",	\
	"PASS", "FAIL", "?PASS", "?FAIL", "UNSUP", "UNRES", "UNTEST"
    printf "%*s  |--------------------------------------------------\n", \
	NameWidth, ""
}

##
## Emit counts

END {
    for (i = 1; i in Tools; i++) {
	Tool = Tools[i]
	for (j = 1; ("t", Tool, j) in Passes; j++) {
	    Pass = Passes["t", Tool, j]
	    if (Passes["t", Tool, "C"] > 1)
		printf "%*s / %-*s  | ", ToolWidth, Tool, PassWidth, Pass
	    else if (Passes["", "C"] > 1)
		printf "%*s   %*s  | ", ToolWidth, Tool, PassWidth, ""
	    else
		printf "%*s  | ", NameWidth, Tool
	    # Passes["t", <tool>, 1] is a pass name or a null string if
	    #  <tool> did not use multipass.
	    printf " %6d %6d %6d %6d %6d %6d %6d%s%s\n",		\
		Totals["tp", Tool, Pass, "PASS"],			\
		Totals["tp", Tool, Pass, "FAIL"],			\
		Totals["tp", Tool, Pass, "KPASS"]			\
		+ Totals["tp", Tool, Pass, "XPASS"],			\
		Totals["tp", Tool, Pass, "KFAIL"]			\
		+ Totals["tp", Tool, Pass, "XFAIL"],			\
		Totals["tp", Tool, Pass, "UNSUPPORTED"],		\
		Totals["tp", Tool, Pass, "UNRESOLVED"],			\
		Totals["tp", Tool, Pass, "UNTESTED"],			\
		(Totals["tp", Tool, Pass, "ERROR"  ] > 0 ? " !E!" : ""), \
		(Totals["tp", Tool, Pass, "WARNING"] > 0 ? " !W!" : "")
	}
    }
}

##
## Emit pass totals

END {
    if (Passes["", "C"] > 1) {
	printf "%*s  |--------------------------------------------------\n", \
	    NameWidth, ""
	for (i = 1; ("", i) in Passes; i++)
	    printf "%*s   %-*s  |  %6d %6d %6d %6d %6d %6d %6d\n",	\
		ToolWidth, "", PassWidth, Passes["", i],		\
		Totals["p", Passes["", i], "PASS"],			\
		Totals["p", Passes["", i], "FAIL"],			\
		Totals["p", Passes["", i], "KPASS"]			\
		+ Totals["p", Passes["", i], "XPASS"],			\
		Totals["p", Passes["", i], "KFAIL"]			\
		+ Totals["p", Passes["", i], "XFAIL"],			\
		Totals["p", Passes["", i], "UNSUPPORTED"],		\
		Totals["p", Passes["", i], "UNRESOLVED"],		\
		Totals["p", Passes["", i], "UNTESTED"]
    }
}

##
## Emit grand totals

END {
    printf "%*s  |--------------------------------------------------\n", \
	NameWidth, ""
    printf "%*s  |  %6d %6d %6d %6d %6d %6d %6d\n", NameWidth, "",	\
	Totals["PASS"], Totals["FAIL"],					\
	Totals["KPASS"] + Totals["XPASS"], Totals["KFAIL"] + Totals["XFAIL"], \
	Totals["UNSUPPORTED"], Totals["UNRESOLVED"], Totals["UNTESTED"]
    printf "%*s  \\__________________________________________________\n", \
	NameWidth, ""
}

#EOF
