" Vim syntax file
" Language:     JSSS-ATT Replay files
" Maintainer:   John B Pierce <piercej@indy.raytheon.com>
" Last Change:  10/08/2004
" Filename:     replay.vim
" Filepath:     on win32 VIM 6.3 this file would be stored at
"               C:\Program Files\Vim\vim63\syntax\replay.vim
" Modify:       C:\Program Files\Vim\vim63\filetype.vim
"               by adding the following statement found between the chevrons
"               <<<au BufNewFile,BufRead *.rpy                  setf replay>>>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" A bunch of useful JSSS-ATT keywords
syn keyword replayStatement     LOG_MODE
syn keyword replayStatement     READPATH
syn keyword replayStatement     WRITEPATH
syn keyword replayStatement     BASELINE_FILE
syn keyword replayStatement     BASELINE_MODE
syn keyword replayStatement     REPLAY_MODE
syn keyword replayStatement     INTERACTIVE_MODE
syn keyword replayStatement     SET
syn keyword replayStatement     FAULT
syn keyword replayStatement     FAULT_MASK
syn keyword replayStatement     RESET
syn keyword replayStatement     RESTART
syn keyword replayStatement     COMPARE
syn keyword replayStatement     COLLATE
syn keyword replayStatement     WAIT
syn keyword replayStatement     RECORD
syn keyword replayStatement     BASELINE
syn keyword replayStatement     SHOW
syn keyword replayStatement     HIDE
syn keyword replayStatement     FRONT
syn keyword replayStatement     BACK
syn keyword replayStatement     PUSH
syn keyword replayStatement     DELAY
syn keyword replayStatement     PAUSE
syn keyword replayStatement     EXECUTE
syn keyword replayStatement     DEFAULT
syn keyword replayStatement     DISPLAY
syn keyword replayStatement     REQUEST
syn keyword replayStatement     VERIFY
syn keyword replayStatement     POWER
syn keyword replayStatement     DTM
syn keyword replayStatement     LOAD
syn keyword replayStatement     AMC_MONITOR
syn keyword replayStatement     RUN
syn keyword replayStatement     SPD
syn keyword replayStatement     TRM
syn keyword replayStatement     WOF
syn keyword replayStatement     SAM
syn keyword replayStatement     STOPWATCH
syn keyword replayTodo contained        TODO

syn keyword replayDisplay  CDU_CPLT
syn keyword replayDisplay  CDU_PLT
syn keyword replayDisplay  EICAS
syn keyword replayDisplay  FDP
syn keyword replayDisplay  MFD_CPLT_IB
syn keyword replayDisplay  MFD_CPLT_OB
syn keyword replayDisplay  MFD_PLT_IB
syn keyword replayDisplay  MFD_PLT_OB
syn keyword replayDisplay  RFIS_CPLT
syn keyword replayDisplay  RFIS_PLT
syn keyword replayDisplay  TRACK_HANDLE
syn keyword replayDisplay  CDU_BIT_CPLT
syn keyword replayDisplay  CDU_BIT_PLT
syn keyword replayDisplay  DEU_BIT_CPLT
syn keyword replayDisplay  DEU_BIT_PLT
syn keyword replayDisplay  FDP_BIT

syn keyword replayKey   L1
syn keyword replayKey   L2
syn keyword replayKey   L3
syn keyword replayKey   L4
syn keyword replayKey   L5
syn keyword replayKey   L6
syn keyword replayKey   L7
syn keyword replayKey   R1
syn keyword replayKey   R2
syn keyword replayKey   R3
syn keyword replayKey   R4
syn keyword replayKey   R5
syn keyword replayKey   R6
syn keyword replayKey   R7
syn keyword replayKey   T1
syn keyword replayKey   T2
syn keyword replayKey   T3
syn keyword replayKey   T4
syn keyword replayKey   T5
syn keyword replayKey   L6
syn keyword replayKey   L7
syn keyword replayKey   ACK
syn keyword replayKey   CDU


"integer number, or floating point number without a dot.
syn match  replayNumber         "\<\d\+\>"
"floating point number, with dot
syn match  replayNumber         "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  replayNumber         "\.\d\+\>"

" String and Character contstants
syn match   replaySpecial contained "\\\d\d\d\|\\."
syn region  replayString                  start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=basicSpecial

syn region  replayComment       start="!" end="$" contains=replayTodo
syn region  replayComment       start="^[ \t]*'" end="$" contains=replayTodo
syn region  replayStepNumber    start="^\d" end="\s"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_replay_syntax_inits")
  if version < 508
    let did_replay_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink replayNumber           Number
  HiLink replayError            Error
  HiLink replayStatement        Statement
  HiLink replayString           String
  HiLink replayComment          Comment
  HiLink replaypecial           Special
  HiLink replayTodo             Todo
  HiLink replayDisplay          Identifier
  HiLink replayKey              Identifier
  HiLink replayTypeSpecifier Type
  "hi basicMathsOperator term=bold cterm=bold gui=bold

  delcommand HiLink
endif

let b:current_syntax = "replay"

" vim: ts=8
