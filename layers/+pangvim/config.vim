" ===
" === THEME
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


" ===
" === SPACELINE.VIM
" ===
let g:spaceline_seperate_style = 'arrow-fade'
let g:spaceline_colorscheme    = 'space'
let g:spaceline_line_symbol    = 0
let g:spaceline_homemode_right = ''
let g:spaceline_filename_left  = ''
let g:spaceline_filesize_right = ''
let g:spaceline_gitinfo_left   = ''
let g:spaceline_gitinfo_right  = ''
let g:spaceline_cocexts_right  = ''
let g:spaceline_lineformat_right = ''
let g:spaceline_seperate_endseperate = ''
let g:spaceline_seperate_emptyseperate = ''


" ===
" === RAINBOW
" ===
let g:rainbow_active = 1


" ===
" === XTABLINE
" ===
nnoremap <LEADER>xt :Tabularize /
let g:xtabline_settings                    = {}
let g:xtabline_settings.enable_mappings    = 0
let g:xtabline_settings.tabline_modes      = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first    = 1
noremap to :XTabCycleMode<CR>
noremap \p :XTabInfo<CR>


" ===
" === VISTA.VIM
" ===
noremap <silent> T :Vista!!<CR>
nnoremap <silent><leader>fv     :Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" ===
" === UNDOTREE
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function! g:Undotree_CustomMap()
	nnoremap <buffer> u <plug>UndotreeNextState
	nnoremap <buffer> e <plug>UndotreePreviousState
	nnoremap <buffer> U 5<plug>UndotreeNextState
	nnoremap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
nnoremap <silent> <leader>fc :Colors<CR>
nnoremap <silent> <leader>bb :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> <leader>bB :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> <leader>ff :<C-u>FzfPreviewDirectoryFiles<CR>
nnoremap <silent> <leader>fr :<C-u>FzfPreviewProjectGrep
nnoremap <silent> <leader>fo :<C-u>FzfPreviewOldFiles<CR>
nnoremap <silent> <leader>fm :<C-u>FzfPreviewMruFiles<CR>
nnoremap <silent> <leader>fp :<C-u>FzfPreviewProjectFiles<CR>
nnoremap <silent> <leader>fP :<C-u>FzfPreviewFromResources project_mru git<CR>
" noremap <C-p> :FZF<CR>
noremap <C-f> :Ag<CR>
noremap <C-h> :MRU<CR>
noremap <C-t> :BTags<CR>
noremap <C-l> :LinesWithPreview<CR>
noremap <C-w> :Buffers<CR>
"noremap ; :History:<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
			\| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
			\ call fzf#vim#buffers(
			\   '',
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:0%', '?'),
			\   <bang>0)


command! -bang -nargs=* LinesWithPreview
			\ call fzf#vim#grep(
			\   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
			\   fzf#vim#with_preview({}, 'up:50%', '?'),
			\   1)

command! -bang -nargs=* Ag
			\ call fzf#vim#ag(
			\   '',
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%', '?'),
			\   <bang>0)


command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang BTags
			\ call fzf#vim#buffer_tags('', {
			\     'down': '40%',
			\     'options': '--with-nth 1
			\                 --reverse
			\                 --prompt "> "
			\                 --preview-window="70%"
			\                 --preview "
			\                     tail -n +\$(echo {3} | tr -d \";\\\"\") {2} |
			\                     head -n 16"'
			\ })


" ===
" === VIM-EASY-ALIGN
" ===
" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)


" ===
" === COC.NVIM
" ===
" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cm  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>cp  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
" Use `[c` and `]c` for navigate diagnostics
nnoremap <silent> ]c <Plug>(coc-diagnostic-prev)
nnoremap <silent> [c <Plug>(coc-diagnostic-next)
" Remap for rename current word
nnoremap <leader>cn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nnoremap <leader>cf  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xnoremap <leader>ca  <Plug>(coc-codeaction-selected)
nnoremap <leader>ca  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nnoremap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nnoremap <leader>qf  <Plug>(coc-fix-current)
" Remap keys for gotos
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
" Use K for show documentation in float window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap [g <Plug>(coc-git-prevchunk)
nnoremap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nnoremap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nnoremap gm <Plug>(coc-git-commit)
nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
" float window scroll
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" multiple cursors
nnoremap <silent> <C-c> <Plug>(coc-cursors-position)
nnoremap <expr> <silent> <C-m> <SID>select_current_word()
xnoremap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nnoremap <leader>x  <Plug>(coc-cursors-operator)

function! s:select_current_word()
	if !get(g:, 'coc_cursors_activated', 0)
		return "\<Plug>(coc-cursors-word)"
	endif
	return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

nnoremap <silent> <leader>cm ::CocSearch -w 
nnoremap <silent> <leader>cw ::CocSearch  
" use normal command like `<leader>xi(`
nnoremap <leader>x  <Plug>(coc-cursors-operator)
" coc-explorer
nnoremap tt :CocCommand explorer<CR>
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>


" ===
" === MARKDOWN-PREVIEW
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === EASY-MOTION
" ===
nnoremap <Leader><Leader>w <Plug>(easymotion-w)
nnoremap <Leader><Leader>f <Plug>(easymotion-f)
nnoremap <Leader><Leader>b <Plug>(easymotion-b)


" ===
" === CAW.VIM
" ===
function! InitCaw() abort
	if ! &l:modifiable
		silent! nunmap <buffer> <Leader>ci
		silent! xunmap <buffer> <Leader>ci
		silent! nunmap <buffer> <Leader>ci
		silent! xunmap <buffer> <Leader>ci
	else
		nmap <buffer> ci <Plug>(caw:prefix)
		xmap <buffer> ci <Plug>(caw:prefix)
		nmap <buffer> ci <Plug>(caw:hatpos:toggle)
		xmap <buffer> ci <Plug>(caw:hatpos:toggle)
	endif
endfunction
autocmd FileType * call InitCaw()
call InitCaw()


" ===
" === VIM-SMARTCHR
" ===
inoremap <expr> , smartchr#one_of(',', ',')
autocmd FileType go inoremap <buffer><expr> ;
			\ smartchr#loop(':=',';')
autocmd FileType go inoremap <buffer> <expr> .
			\ smartchr#loop('.', '<-', '->','...')


" ===
" === AUTO-FORMAT
" ===
nnoremap \f :Autoformat<CR>


" ===
" === TABLE
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === VIM-EASYGIT
" ===
let g:easygit_enable_command = 1
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gB :Gbrowse<CR>
nnoremap <silent> <Leader>gS :Gstatus<CR>


" ===
" === SUDA.VIM
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === VIMSPECTOR
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad


" ===
" === ULTISNIPS
" ===
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
silent! au BufEnter,BufRead,BufNewFile * silent! unnoremap <c-r>
" Solve extreme insert-mode lag on macOS (by disabling autotrigger)
augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END


" ===
" === MARKDOWN-SETTINGS
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === VIM-MARKDOWN-TOC
" ===
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === VIM-CLAP
" ===
nnoremap <C-p> :Clap<CR>
let g:clap_layout = { 'relative': 'editor' }
let g:clap_provider_alias = {'hist:': 'command_history'}
let g:clap_open_action = {'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'}
let g:clap_theme = 'material_design_dark'


" ===
" === VIM-SANDWICH
" ===
nmap <silent> sa <Plug>(operator-sandwich-add)
xmap <silent> sa <Plug>(operator-sandwich-add)
omap <silent> sa <Plug>(operator-sandwich-g@)
nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> sd <Plug>(operator-sandwich-delete)
nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> sr <Plug>(operator-sandwich-replace)
nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
omap kb <Plug>(textobj-sandwich-auto-i)
xmap kb <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ks <Plug>(textobj-sandwich-query-i)
xmap ks <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
xmap as <Plug>(textobj-sandwich-query-a)

" ===
" === CHOOSEWIN
" ===
nnoremap _ <Plug>(choosewin)
" nnoremap <Leader>- :<C-u>ChooseWinSwapStay<CR>


" ===
" === LANGUAGECLIENT-NEOVIM
" ===
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
