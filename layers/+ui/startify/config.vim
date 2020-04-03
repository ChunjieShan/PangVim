
" For startify
let g:startify_padding_left = 30
let s:header = [
			\ '',
			\ ' ____                      _   _         __     ___           ',
			\ '|  _ \ __ _ _ __   __ _   | \ | | ___  __\ \   / (_)_ __ ___  ',
			\ '| |_) / _` | `_ \ / _` |  |  \| |/ _ \/ _ \ \ / /| | `_ ` _ \ ',
			\ '|  __/ (_| | | | | (_| |  | |\  |  __/ (_) \ V / | | | | | | |',
			\ '|_|   \__,_|_| |_|\__, |  |_| \_|\___|\___/ \_/  |_|_| |_| |_|',
			\ '                  |___/                                       ',
			\ '                                                              ',
			\ '                       Version: 0.4.0                         ',
			\ '                [ PangVim  Author: Chunjie Shan]              ',
			\ '',
			\ ]

let s:footer = [
      \ '+-------------------------------------------+',
      \ '|                PangVim                    |',
      \ '|                                           |',
      \ '|              Keep Going!                  |',
      \ '|                                           |',
      \ '|            GitHub:ChunjieShan             |',
      \ '+-------------------------------------------+',
      \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center(s:header)
let g:startify_custom_footer = s:center(s:footer)
