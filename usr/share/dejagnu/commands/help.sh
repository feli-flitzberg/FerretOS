#!/bin/sh
# help.sh -- "dejagnu help" command
#
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

# ##help
# #Usage: dejagnu help [ OPTIONS... ] COMMAND
# #	--verbose, -v		Emit additional messages
# #	--path, -w		Passed to man(1)
# #	-W			Passed to man(1)
# ##end

# shellcheck disable=SC2003
# The shellcheck tool complains about use of expr and recommends using
# newer shell features instead.  Solaris 10 /bin/sh does not support the
# newer features, so we must use expr in this script.

# shellcheck disable=SC2006
# The shellcheck tool complains about the old style backtick command
# substitution.  Solaris 10 /bin/sh does not support the new style $()
# command substitution and the usage of command substitution in this script
# is simple enough to work.  Most notably, nesting backtick command
# substitution is tricky, but we do not do that.

# This script was written by Jacob Bachmeyer.

# For testing and development
in_test_mode=false
if test x"$1" = x--DGTest ; then
    in_test_mode=true
    shift
fi

args=
command=dejagnu
verbose=0
for a in "$@"; do
    case $a in
	-v|--v|-verb*|--verb*)	verbose=`expr $verbose + 1` ;;
	-w|-W|--path)		args="${args} ${a}" ;;
	-*)			echo Unrecognized option "\"$a\"" ;;
	*)			command="${command}-${a}" ;;
    esac
done

if expr "$verbose" \> 0 > /dev/null ; then
    echo Verbose level is $verbose
fi

## Get the location of this script and check for nearby "doc" dir.
commdir=`echo "$0" | sed -e 's@/[^/]*$@@'`
docdir=`echo "$commdir" | sed -e 's@/[^/]*$@@'`/doc

if expr "$verbose" \> 0 > /dev/null ; then
    echo Running from "$commdir"
    if expr "$verbose" \> 1 > /dev/null ; then
	echo Probing "$docdir"
    fi
fi

if test -d "$docdir"; then
    if expr "$verbose" \> 1 > /dev/null ; then
	echo Probing "${docdir}/${command}.1"
    fi
    if test -r "${docdir}/${command}.1" ; then
	command="${docdir}/${command}.1"
    fi
fi

# Word splitting on the "args" variable is intended.
# Globbing is not, but ensure that verbose output will show the problem.

if expr "$verbose" \> 0 > /dev/null ; then
    #shellcheck disable=SC2086
    echo Forwarding to man $args "\"$command\""
fi

if $in_test_mode ; then
    echo man "$args $command"
else
    #shellcheck disable=SC2086
    exec man $args "$command"
fi

#EOF
