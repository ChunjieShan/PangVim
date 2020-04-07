" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
" set clipboard=unnamedplus
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set noswapfile
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell

set colorcolumn=80
set updatetime=1000
set virtualedit=block


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

augroup TermHandling
	autocmd!
	" Turn off line numbers, listchars, auto enter insert mode and map esc to
	" exit insert mode
	autocmd TermOpen * setlocal listchars= nonumber norelativenumber
				\ | startinsert
	autocmd FileType fzf call LayoutTerm(0.6, 'horizontal')
augroup END

function! LayoutTerm(size, orientation) abort
	let timeout = 16.0
	let animation_total = 120.0
	let timer = {
				\ 'size': a:size,
				\ 'step': 1,
				\ 'steps': animation_total / timeout
				\}

	if a:orientation == 'horizontal'
		resize 1
		function! timer.f(timer)
			execute 'resize ' . string(&lines * self.size * (self.step / self.steps))
			let self.step += 1
		endfunction
	else
		vertical resize 1
		function! timer.f(timer)
			execute 'vertical resize ' . string(&columns * self.size * (self.step / self.steps))
			let self.step += 1
		endfunction
	endif
	call timer_start(float2nr(timeout), timer.f, {'repeat': float2nr(timer.steps)})
endfunction

" Open autoclosing terminal, with optional size and orientation
function! OpenTerm(cmd, ...) abort
	let orientation = get(a:, 2, 'horizontal')
	if orientation == 'horizontal'
		new | wincmd J
	else
		vnew | wincmd L
	endif
	call LayoutTerm(get(a:, 1, 0.5), orientation)
	call termopen(a:cmd, {'on_exit': {j,c,e -> execute('if c == 0 | close | endif')}})
endfunction


exec "nohlsearch"
set incsearch

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif
function! HeaderPython()
	call setline(1, "#!/usr/bin/python3")
	call append(1, "# -*- coding: utf8 -*-")
	normal G
	normal o
	normal o
endf


autocmd bufnewfile *.py call HeaderPython()

function! HeaderShell()
	call setline(1, "#!/bin/sh")
	normal G
	normal o
	normal o
endf

autocmd bufnewfile *.sh call HeaderShell()

"let g:neocomplete#enable_at_startup=1
function! HeaderC()
	call setline(1, "#include <stdio.h>")
	normal G
	normal o
	normal o
endf
autocmd bufnewfile *.c call HeaderC()

function! HeaderCpp()
	call setline(1, "#include <iostream>")
	normal G
	normal o
	normal o
endf
autocmd bufnewfile *.cpp call HeaderCpp()

" ===
" === AUTOSAVE
" ===
function! s:autosave(enable)
	augroup autosave
		autocmd!
		if a:enable
			autocmd TextChanged,InsertLeave <buffer>
						\  if empty(&buftype) && !empty(bufname(''))
						\|   silent! update
						\| endif
		endif
	augroup END
endfunction

command! -bang AutoSave call s:autosave(<bang>1)


" ===
" === BASH-LANGUAGE-SERVER
" ===
if executable('bash-language-server')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'bash-language-server',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
				\ 'whitelist': ['sh'],
				\ })
endif
let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }
