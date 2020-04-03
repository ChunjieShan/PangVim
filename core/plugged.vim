call plug#begin()

Plug 'taigacute/spaceline.vim'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rking/ag.vim'
Plug 'yuttie/comfortable-motion.vim'

Plug 'bagrat/vim-buffet'
source $VIM_PATH/layers/+ui/buffet/config.vim

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

Plug 'ludovicchabant/vim-gutentags'
source  $VIM_PATH/layers/+tools/vim-gutentags/config.vim

Plug 't9md/vim-choosewin'
source  $VIM_PATH/layers/+tools/choosewin/config.vim

Plug 'mhinz/vim-startify'
source  $VIM_PATH/layers/+ui/startify/config.vim
function! StartifyEntryFormat()
	return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

Plug 'junegunn/vim-easy-align'
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1

Plug 'simnalamburt/vim-mundo'

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_prompt = 'Jump to → '
let g:EasyMotion_keys = 'fjdkswbeoavn'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'junegunn/goyo.vim'
source  $VIM_PATH/layers/+tools/goyo/config.vim

Plug 'junegunn/Limelight.vim'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'mattn/emmet-vim'
let g:user_emmet_complete_tag = 0
let g:user_emmet_install_global = 0
let g:user_emmet_install_command = 0
let g:user_emmet_mode = 'i'

Plug 'liuchengxu/vista.vim'
source  $VIM_PATH/layers/+tools/vista/config.vim

Plug 'Yggdroot/indentLine'
source $VIM_PATH/layers/+ui/indentline/config.vim

Plug 'tyru/caw.vim'

Plug 'sbdchd/neoformat'
source  $VIM_PATH/layers/+tools/neoformat/config.vim

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_level = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_edit_url_in = 'vsplit'
let g:vim_markdown_fenced_languages = [
  \ 'c++=cpp',
  \ 'viml=vim',
  \ 'bash=sh',
  \ 'ini=dosini',
  \ 'js=javascript',
  \ 'json=javascript',
  \ 'jsx=javascriptreact',
  \ 'tsx=typescriptreact',
  \ 'docker=Dockerfile',
  \ 'makefile=make',
  \ 'py=python'
  \ ]


Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

Plug 'junegunn/vim-emoji'
set completefunc=emoji#complete

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'

Plug 'chemzqm/vim-easygit'
let g:easygit_enable_command = 1

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
source  $VIM_PATH/layers/+completion/fzf/config.vim

Plug 'yuki-ycino/fzf-preview.vim'
source  $VIM_PATH/layers/+completion/fzf/config.vim

" THEME
Plug 'ajmwagar/vim-deus'
Plug 'junegunn/seoul256.vim'

Plug 'mbbill/undotree'

Plug 'kana/vim-smartchr'

Plug 'kana/vim-niceblock'
Plug 'osyo-manga/vim-textobj-multiblock'

Plug 'tweekmonster/braceless.vim'

Plug 'tpope/vim-repeat'

Plug 'Chiel92/vim-autoformat'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

Plug 'jiangmiao/auto-pairs'

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

Plug 'w0rp/ale'
source ~/.config/nvim/layers/+checkers/ale/config.vim

Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'


Plug 'lambdalisue/suda.vim'

Plug 'godlygeek/tabular'

Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}

Plug 'machakann/vim-sandwich'
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }

Plug 'tpope/vim-surround'
call plug#end()
