��    u      �  �   l      �	  �   �	  �   �
  �  �         �  �   �  �  �  U  \  �  �  �  n  F       Z     n     �  &   �     �  -   �       !   6     X     t     �  ,   �     �  .   �  '   !  (   I     r  %   �     �     �     �     �     �  *     1   ,     ^  �   w  &        /     F     c       $   �     �     �  �   �     �     �     �     �     �  <   �  #   /     S     n     �  "   �     �     �  &   �     �          %     7     V  )   c     �  �   �     �  ;   �  3   �  /   #   +   S   '      #   �      �      �      !  b   !     z!     |!  4   �!     �!  !   �!  -   "  .   ="     l"     �"     �"     �"     �"     �"     #     #     )#     =#     K#     f#     u#     }#  $   �#     �#  ,   �#  *   �#     ($     5$     B$     O$     c$     }$     �$  -   �$  ?   �$     %     %  �  7%  u  '  �  z(  .  *     G-  6  g-  W  �/  �  �0  �  z4  �  )7  �  �:  �  �=  '   v?  :   �?  ,   �?  R   @  4   Y@  i   �@  (   �@  a   !A  .   �A  2   �A  #   �A  C   	B  3   MB  V   �B  :   �B  ;   C  3   OC  e   �C     �C     �C     �C      D      0D  Y   QD  q   �D      E  �   >E  ~   2F  8   �F  ?   �F  <   *G  4   gG  C   �G  4   �G  0   H  Q  FH     �I  !   �I  C   �I     J      :J  n   [J  M   �J  9   K  >   RK  �   �K  4   :L     oL  A   ~L  u   �L  4   6M  *   kM  *   �M  6   �M  #   �M  H   N  (   eN  [  �N     �P  @   Q  4   DQ  0   yQ  ,   �Q  (   �Q  $    R      %R     FR     cR  �   tR     �R  6   �R  M   5S  S   �S  L   �S  \   $T  |   �T  8   �T  4   7U  4   lU  5   �U  E   �U  ;   V  @   YV     �V  )   �V  #   �V  9   W  %   BW     hW     yW  E   �W  ,   �W  G   X  F   TX      �X      �X      �X  R   �X  7   QY  ,   �Y     �Y  ^   �Y  �   4Z     �Z  $   �Z     u       P   )   f          [      U   K   Q          
       Y   i   S   $       V       %      @   !   r   *   7           F   \   I   /   E                p   _       q          J              t       j   <   T       >   n             e   g            H   1   `               o   (       +   l   	   ,   4   O       s       '   a      k   &   A   D              R   ?   ]   b   0   M       #             -       =   8      6       N      L      C   Z      2   5              h              "       ;       m             c           W   X   3   :          B   G      ^   .           9   d        
Context control:
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
  -C, --context=NUM         print NUM lines of output context
 
Miscellaneous:
  -s, --no-messages         suppress error messages
  -v, --invert-match        select non-matching lines
  -V, --version             display version information and exit
      --help                display this help text and exit
 
Output control:
  -m, --max-count=NUM       stop after NUM selected lines
  -b, --byte-offset         print the byte offset with output lines
  -n, --line-number         print line number with output lines
      --line-buffered       flush output on every line
  -H, --with-filename       print file name with output lines
  -h, --no-filename         suppress the file name prefix on output
      --label=LABEL         use LABEL as the standard input file name prefix
 
grep -P uses PCRE2 %s
       --include=GLOB        search only files that match GLOB (a file pattern)
      --exclude=GLOB        skip files that match GLOB
      --exclude-from=FILE   skip files that match any file pattern from FILE
      --exclude-dir=GLOB    skip directories that match GLOB
   -E, --extended-regexp     PATTERNS are extended regular expressions
  -F, --fixed-strings       PATTERNS are strings
  -G, --basic-regexp        PATTERNS are basic regular expressions
  -P, --perl-regexp         PATTERNS are Perl regular expressions
   -I                        equivalent to --binary-files=without-match
  -d, --directories=ACTION  how to handle directories;
                            ACTION is 'read', 'recurse', or 'skip'
  -D, --devices=ACTION      how to handle devices, FIFOs and sockets;
                            ACTION is 'read' or 'skip'
  -r, --recursive           like --directories=recurse
  -R, --dereference-recursive  likewise, but follow all symlinks
   -L, --files-without-match  print only names of FILEs with no selected lines
  -l, --files-with-matches  print only names of FILEs with selected lines
  -c, --count               print only a count of selected lines per FILE
  -T, --initial-tab         make tabs line up (if needed)
  -Z, --null                print 0 byte after FILE name
   -NUM                      same as --context=NUM
      --group-separator=SEP  print SEP on line between matches with context
      --no-group-separator  do not print separator for matches with context
      --color[=WHEN],
      --colour[=WHEN]       use markers to highlight the matching strings;
                            WHEN is 'always', 'never', or 'auto'
  -U, --binary              do not strip CR characters at EOL (MSDOS/Windows)

   -e, --regexp=PATTERNS     use PATTERNS for matching
  -f, --file=FILE           take PATTERNS from FILE
  -i, --ignore-case         ignore case distinctions in patterns and data
      --no-ignore-case      do not ignore case distinctions (default)
  -w, --word-regexp         match only whole words
  -x, --line-regexp         match only whole lines
  -z, --null-data           a data line ends in 0 byte, not newline
   -o, --only-matching       show only nonempty parts of lines that match
  -q, --quiet, --silent     suppress all normal output
      --binary-files=TYPE   assume that binary files are TYPE;
                            TYPE is 'binary', 'text', or 'without-match'
  -a, --text                equivalent to --binary-files=text
 %s home page: <%s>
 %s: PCRE detected recurse loop %s: binary file matches %s: exceeded PCRE's backtracking limit %s: exceeded PCRE's heap limit %s: exceeded PCRE's nested backtracking limit %s: exhausted PCRE JIT stack %s: input file is also the output %s: internal PCRE error: %d %s: invalid option -- '%c'
 %s: memory exhausted %s: option '%s%s' doesn't allow an argument
 %s: option '%s%s' is ambiguous
 %s: option '%s%s' is ambiguous; possibilities: %s: option '%s%s' requires an argument
 %s: option requires an argument -- '%c'
 %s: unrecognized option '%s%s'
 %s: warning: recursive directory loop ' (C) (standard input) * at start of expression + at start of expression -P supports only unibyte and UTF-8 locales -P supports only unibyte locales on this platform ? at start of expression Example: %s -i 'hello world' menu.h main.c
PATTERNS can contain multiple patterns separated by newlines.

Pattern selection and interpretation:
 General help using GNU software: <%s>
 Invalid back reference Invalid character class name Invalid collation character Invalid content of \{\} Invalid preceding regular expression Invalid range end Invalid regular expression License GPLv3+: GNU GPL version 3 or later <%s>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
 Memory exhausted No match No previous regular expression Packaged by %s
 Packaged by %s (%s)
 Perl matching not supported in a --disable-perl-regexp build Premature end of regular expression Regular expression too big Report %s bugs to: %s
 Report bugs to: %s
 Search for PATTERNS in each FILE.
 Success Trailing backslash Try '%s --help' for more information.
 Unknown system error Unmatched ( or \( Unmatched ) or \) Unmatched [, [^, [:, [., or [= Unmatched \{ Usage: %s [OPTION]... PATTERNS [FILE]...
 Valid arguments are: When FILE is '-', read standard input.  With no FILE, read '.' if
recursive, '-' otherwise.  With fewer than two FILEs, assume -h.
Exit status is 0 if any line is selected, 1 otherwise;
if any error occurs and -q is not given, the exit status is 2.
 Written by %s and %s.
 Written by %s, %s, %s,
%s, %s, %s, %s,
%s, %s, and others.
 Written by %s, %s, %s,
%s, %s, %s, %s,
%s, and %s.
 Written by %s, %s, %s,
%s, %s, %s, %s,
and %s.
 Written by %s, %s, %s,
%s, %s, %s, and %s.
 Written by %s, %s, %s,
%s, %s, and %s.
 Written by %s, %s, %s,
%s, and %s.
 Written by %s, %s, %s,
and %s.
 Written by %s, %s, and %s.
 Written by %s.
 Written by Mike Haertel and others; see
<https://git.savannah.gnu.org/cgit/grep.git/tree/AUTHORS>. ` ambiguous argument %s for %s character class syntax is [[:space:]], not [:space:] conflicting matchers specified exceeded PCRE's line length limit failed to return to initial working directory failed to set file descriptor text/binary mode input is too large to count invalid argument %s for %s invalid character class invalid content of \{\} invalid context length argument invalid matcher %s invalid max count memory exhausted no syntax specified program error regular expression too big stack overflow stray \ stray \ before %lc stray \ before unprintable character stray \ before white space the -P option only supports a single pattern unable to record current working directory unbalanced ( unbalanced ) unbalanced [ unfinished \ escape unknown binary-files type unknown devices method warning: %s warning: --unix-byte-offsets (-u) is obsolete warning: GREP_COLOR='%s' is deprecated; use GREP_COLORS='mt=%s' write error {...} at start of expression Project-Id-Version: GNU grep 3.10.12
Report-Msgid-Bugs-To: bug-grep@gnu.org
PO-Revision-Date: 2023-05-13 03:04+0300
Last-Translator: Viachaslau Khalikin <viachaslau.vinegret@outlook.com>
Language-Team: Belarusian <debian-l10n-belarusian@lists.debian.org>
Language: be
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Bugs: Report translation errors to the Language-Team address.
X-Generator: Emacs 28.2, po mode 2.27
 
Кіраваньне кантэкстам:
  -B, --before-context=ЛІК  надрукаваць ЛІК радкоў папярэдняга кантэксту
  -A, --after-context=ЛІК   надрукаваць ЛІК радкоў наступнага кантэксту
  -C, --context=ЛІК         надрукаваць ЛІК выходнага кантэксту
 
Разнастайныя:
  -s, --no-messages         заглушаць паведамленьні аб памылках
  -v, --invert-match        выбіраць несупастаўныя радкі
  -V, --version             адлюстраваць зьвесткі аб вэрсіі ды выйсьці
      --help                адлюстраваць гэтую даведку ды выйсьці
 
Кіраваньне вывадам:
  -m, --max-count=ЛІК       спыніцца пасьля ЛІК радкоў
  -b, --byte-offset         друкаваць байтавае зрушэньне з радкамі вываду
  -n, --line-number         друкаваць нумар радка з радкамі вываду
      --line-buffered       скідваць буфэр пасьля кожнага радка
  -H, --with-filename       друкаваць назву файла разам з радкамі вываду
  -h, --no-filename         заглушаць назвы файлаў на вывадзе
      --label=МЕТКА         выкарыстоўваць МЕТКА ў якасьці назвы файла для
                            стандартнага ўводу
 
grep -P ужывае PCRE2 %s
       --include=ГЛАБ        шукаць толькі тыя файлы, якія адпавядаюць ГЛАБ
                            (файлаваму ўзору)
      --exclude=ГЛАБ        абмінаць файлы, якія адпавядаюць ГЛАБ
      --exclude-from=ФАЙЛ   абмінаць файлы, якія адпавядаюць любому
                            файлаваму ўзору з ФАЙЛа
      --exclude-dir=ГЛАБ    абмінаць каталёгі, якія адпавядаюць ГЛАБ
   -E, --extended-regexp     УЗОРЫ — пашыраныя рэгулярныя выразы
  -F, --fixed-strings       УЗОРЫ — звычайныя радкі
  -G, --basic-regexp        УЗОРЫ — базавыя рэгулярныя выразы
  -P, --perl-regexp         УЗОРЫ — рэгулярныя выразы Perl
   -I                        раўназначна --binary-files=without-match
  -d, --directories=ДЗЕЯНЬНЕ  як апрацоўваць каталёгі;
                              ДЗЕЯНЬНЕ можа быць  «read» (чытаць),
                              «recurse» (рэкурсіўна абходзіць)
                              ці  «skip» (абмінаць)
  -D, --devices=ДЗЕЯНЬНЕ    як апрацоўваць файлы прылад, FIFO й сокеты;
                            ДЗЕЯНЬНЕ можа быць  «read» (чытаць)
                            ці  «skip» (абмінаць)
  -r, --recursive           тое ж, што й --directories=recurse
  -R, --dereference-recursive  гэтак жа, але з пераходам па ўсім сымбалічным
                               спасылкам
   -L, --files-without-match  надрукаваць назвы толькі тых ФАЙЛаў,
                             у якіх няма выбраных радкоў
  -l, --files-with-matches  надрукаваць толькі назвы ФАЙЛаў з выбранымі
                            радкамі
  -c, --count               надрукаваць толькі колькасьць выбраных радкоў
                            да ФАЙЛа
  -T, --initial-tab         выраўнаваць табуляцыяй (калі патрэбна)
  -Z, --null                друкаваць байт «0» пасьля назвы ФАЙЛа
   -NUM                      тое ж, што й --context=ЛІК
      --group-separator=РАЗ  надрукаваць РАЗ у радку паміж супадзеньнямі
                             з кантэкстам
      --no-group-separator  не друкаваць разьдзяляльнік паміж
                            супадзеньнямі з кантэкстам
      --color[=КАЛІ],
      --colour[=КАЛІ]       выкарыстоўваць маркеры да падсьветкі адпаведных
                            радкоў;
                            КАЛІ можа быць «always» (заўсёды),
                            «never» (ніколі) ці «auto» (аўтаматычна)
  -U, --binary              не выдаляць сымбалі CR у канцы радка
                            (MSDOS/Windows)

   -e, --regexp=УЗОРЫ        выкарыстоўваць УЗОРЫ для супастаўленьня
  -f, --file=ФАЙЛ           прымаць УЗОРЫ з ФАЙЛа
  -i, --ignore-case         ігнараваць рэгістар літар ва ўзорах і даных
      --no-ignore-case      не ігнараваць рэгістар літар (прадвызначана)
  -w, --word-regexp         супастаўляць цэламу слову
  -x, --line-regexp         супастаўляць цэламу радку
  -z, --null-data           радок даных падзелены нулявым байтам,
                            а ня сымбалем пераводу радка
   -o, --only-matching       паказваць толькі адпаведныя непустыя часткі радкоў
  -q, --quiet, --silent     заглушаць увесь звычайны вывад
      --binary-files=ТЫП    лічыць, што двайковыя файлы маюць ТЫП;
                            ТЫП можа быць «binary», «text» ці «without-match»
  -a, --text                раўназначна --binary-files=text
 Хатняя старонка %s: <%s>
 %s: выяўлены рэкурсіўны цыкл у PCRE %s: двайковы файл супадае %s: перавышаны ліміт пошуку зь вяртаньнем у PCRE %s: перавышаны ліміт кучы ў PCRE %s: перавышаны ліміт укладзенага пошуку зь вяртаньнем у PCRE %s: вычарпаны стэк JIT PCRE %s: уваходны файл таксама выкарыстоўваецца для вываду %s: унутраная памылка PCRE: %d %s: няправільная опцыя -- «%c»
 %s: памяць вычарпана %s: опцыя «%s%s» не дапускае аргумэнтаў
 %s: опцыя «%s%s» неадназначная
 %s: опцыя «%s%s» неадназначная; магчымыя варыянты: %s: опцыя «%s%s» патрабуе аргумэнт
 %s: опцыя патрабуе аргумэнт -- «%c»
 %s: нераспазнаная опцыя «%s%s»
 %s: папярэджаньне: зацыклены рэкурсіўны абход каталёгаў » © (стандартны ўвод) * у пачатку выразу + у пачатку выразу -P падтрымлівае толькі аднабайтавыя ды UTF-8 лякалі -P падтрымлівае толькі аднабайтавыя лякалі на гэтай плятформе ? у пачатку выразу Прыклад: %s -i 'hello world' menu.h main.c
УЗОРЫ могуць зьмяшчаць некалькі ўзораў, падзеленых сымбалямі новага радка.

Выбар узору й інтэрпрэтацыя:
 Агульная даведка па выкарыстаньні праграмнага забесьпячэньня GNU: <%s>
 Памылковая зваротная спасылка Няправільная назва клясы сымбаляў Няправільны сымбаль параўнаньня Няправільнае зьмесьціва ў\{\} Памылковы папярэдні рэгулярны выраз Няправільны канец дыяпазону Памылковы рэгулярны выраз Ліцэнзія GPLv3+: GNU GPL вэрсіі 3 або навей <%s>.
Гэта свабоднае праграмнае забесьпячэньне: вы можаце вольна зьмяняць і распаўсюджваць яго.
Няма НІЯКІХ ГАРАНТЫЙ у межах дзеючага заканадаўства.
 Памяць вычарпана Няма супадзеньняў Няма папярэдняга рэгулярнага выраза Пакавальнік: %s
 Пакавальнік: %s (%s)
 Супастаўленьні Perl не падтрымліваюцца ў зборцы з --disable-perl-regexp Заўчаснае завяршэньне рэгулярнага выразу Рэгулярны выраз занадта вялікі Паведамляйце пра памылкі ў %s на: %s
 Паведамляйце пра памылкі на: %s
Паведамляйце пра памылкі перакладу на: debian-l10n-belarusian@lists.debian.org
 Шукаць УЗОРЫ ў кожным ФАЙЛе.
 Посьпех Канчатковая адваротная косая рыска Паспрабуйце «%s --help» для атрыманьня больш падрабязных зьвестак.
 Невядомая сыстэмная памылка Несупастаўляльны ( ці \( Несупастаўляльны ) ці \) Несупастаўляльны [, [^, [:, [. ці [= Несупастаўляльны \{ Выкарыстаньне: %s [ОПЦЫЯ]... УЗОРЫ [ФАЙЛ]...
 Сапраўдныя аргумэнты: Калі ў якасьці ФАЙЛа пазначаны сымбаль «-», тады чытаецца стандартны ўвод.
Калі ФАЙЛ ня вызначаны, то чытаецца «.» у рэкурсіўным рэжыме, інакш «-». 
Калі вызначана менш чым два ФАЙЛы, тады мяркуецца -h.
Код завяршэньня 0 — калі знойдзены супадзеньні любога радка, 1 - калі іх няма,
2 - калі адбылася памылка й не выкарыстоўвалася опцыя -q .
 Аўтары: %s і %s.
 Аўтары: %s, %s, %s,
%s, %s, %s, %s,
%s, %s і іншыя.
 Аўтары: %s, %s, %s,
%s, %s, %s, %s,
%s і %s.
 Аўтары: %s, %s, %s,
%s, %s, %s, %s
і %s.
 Аўтары: %s, %s, %s,
%s, %s, %s і %s.
 Аўтары: %s, %s, %s,
%s, %s і %s.
 Аўтары: %s, %s, %s,
%s і %s.
 Аўтары: %s, %s, %s
і %s.
 Аўтары: %s, %s і %s.
 Аўтар: %s.
 Аўтары праграмы: Mike Haertel і іншыя; глядзіце
<https://git.savannah.gnu.org/cgit/grep.git/tree/AUTHORS>. « неадназначны аргумэнт %s для %s сынтаксіс клясы сымбаляў [[:space:]], а не [:space:] зададзены супярэчлівыя ўмовы супастаўленьня перавышана абмежаваньне даўжыні радка PCRE не атрымалася вярнуцца ў пачатковы рабочы каталёг не атрымалася задаць тэкставы або двайковы рэжым дэскрыптара файла увод занадта вялікі да падліку няправільны аргумэнт %s для %s няправільная кляса сымбаляў няправільнае зьмесьціва ў \{\} памылковы аргумэнт даўжыні кантэксту няправільны параўнальны выраз %s памылковая максымальная колькасць памяць вычарпана сынтаксіс нявызначаны праграмная памылка занадта вялікі рэгулярны выраз перапаўненьне стэка залішні \ залішні \ перад %lc залішні \ перад недрукаваным сымбалем залішні \ перад прагалам опцыя -P падтрымлівае толькі адзін узор нельга захаваць бягучы рабочы каталёг неўраўнаважаная ( неўраўнаважаная ) неўраўнаважаная [ незавершаная \ экраніруючая пасьлядоўнасьць невядомы тып двайковых файлаў невядомы мэтад прыладаў папярэджаньне: %s папярэджаньне: --unix-byte-offsets (-u) зьяўляецца састарэлым папярэджаньне: GREP_COLOR=«%s» састарэла;
               выкарыстоўвайце GREP_COLORS=«mt=%s» памылка запісу {...} у пачатку выразу 