#!/bin/bash

LC_ALL=C
PATH=/usr/bin:/bin

bail() { echo "FATAL: $1"; exit 1; }
grep --version > /dev/null 2> /dev/null || bail "no working grep"
sed '' /dev/null || bail "no working sed"
sort /dev/null || bail "no working sort"

ver_check()
{
  if ! type -p $2 &>/dev/null
  then
    echo "ERROR: Cannot find $2 ($1)"; return 1;
  fi
  v=$($2 --version 2>&1 | grep -E -o '[0-9]+\.[0-9\.]+[a-z]*' | head -n1)
  if printf '%s\n' $3 $v | sort --version-sort --check &>/dev/null
  then
    printf "OK: %-9s %-6s >= $3\n" "$1" "$v"; return 0;
  else
    printf "ERROR: %-9s not usable ($3 or later needed)\n" "$1";
    return 1;
  fi
}

ver_kernel()
{
  kver=$(uname -r | grep -E -o '^[0-9\.]+')
  if printf '%s\n' $1 $kver | sort --version-sort --check &>/dev/null
  then
    printf "OK: linux ($kver) >= $1\n"; return 0;
  else
    printf "ERROR: linux ($kver) not usable ($1 or later needed)\n" "$kver";
    return 1;
  fi
}

ver_check coreutils sort 8.1 || bail "coreutils too old"
ver_check bash bash 3.2
ver_check binutils ld 2.13.1
ver_check bison bison 2.7
ver_check diffutils diff 2.8.1
ver_check findutils find 4.2.31
ver_check gawk gawk 4.0.1
ver_check gcc gcc 5.2
ver_check "g++" g++ 5.2
ver_check grep grep 2.5.1a
ver_check m4 m4 1.4.10
ver_check make make 4.0
ver_check patch patch 2.5.4
ver_check perl perl 5.8.8
ver_check python python3 3.4
ver_check sed sed 4.1.5
ver_check tar tar 1.22
ver_check texinfo texi2any 5.0
ver_check xz xz 5.0.0
ver_kernel 4.19

if mount | grep -q 'devpts on /dev/pts' && [ -e /dev/ptmx ]
then echo "OK: kernel supports unix 98 pty";
else echo "ERROR: kernel cannot support unix 98 pty"; fi

alias_check()
{
  if $1 --version 2>&1 | grep -qi $2
  then printf "OK: %-4s is $2\n" "$1";
  else printf "ERROR: %-4s is not $2\n" "$1"; fi
}

echo "aliases:"
alias_check awk GNU
alias_check yacc bison
alias_check sh bash

echo "compiler check:"
if printf "int main(){}" | g++ -x c++ -
then echo "OK: g++ works";
else echo "ERROR: g++ doesn't work"; fi
rm -f a.out

if [ "$(nproc)" = "" ]; then
  echo "ERROR: nproc not working"
else
  echo "OK: nproc reports $(nproc) cores"
fi
