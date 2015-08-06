" general "
set nu
set hlsearch
set incsearch
set nocompatible
set nomodeline

set nobackup
set noswapfile

" code "
syntax on
let c_space_errors = 1
set completeopt=menu,preview
set shiftwidth=2
"set tags=/home/nittch/taff/metaheuristique/meta/src/ctags
set foldnestmax=1
set foldmethod=syntax
set nofoldenable
if has("cscope")
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set cscopetag                           " Use cscope and ctags
  set cscopetagorder=0                    " Search cscope first
  if filereadable("cscope.out")
    cs add cscope.out
  endif
endif

" plugin syntastic pour C++11
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall -W -Wextra'
let g:syntastic_cpp_include_dirs = [ 'includes', 'include', '../include', '/home/nicolas/devel/FiatLux/FiatLuxNet/trunk/include/', '/home/nicolas/devel/FiatLux/FiatLuxNet/trunk/libeikeotools/include/' ]
" let g:syntastic_cpp_auto_refresh_includes = 1
" let g:syntastic_cpp_remove_include_errors = 1
" let g:syntastic_cpp_check_header = 1
" 
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1

" espace insequable utf8
highlight BadSpace ctermbg=magenta guibg=magenta
match BadSpace / /
autocmd WinEnter * match BadSpace / /

" Interface "
set background=dark
set mouse=a
"set cul
if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono:h10
  colorscheme koehler
  set guioptions-=T
  set guioptions-=m
endif
set ruler

" Autocmd "
filetype on
filetype plugin on
autocmd FileType c,cpp,hh,cc,hxx :set cindent
autocmd FileType yy,ll :set syntax=cpp
autocmd FileType mail :set tw=72
augroup filetypedetect
  au BufNewFile,BufRead *.tex setlocal spell spelllang=fr
augroup end 
augroup filetype " google protocol buffers
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END


function s:spell_fr()
    if !exists("s:spell_check") || s:spell_check == 0
        echo "Correction orthographique activée (français)"
        let s:spell_check = 1
        setlocal spell spelllang=fr
    else
        echo "Correction orthographique désactivée"
        let s:spell_check = 0
        setlocal spell spelllang=
    endif
endfunction
" for English
function s:spell_en()
  if !exists("s:spell_check") || s:spell_check == 0
    echo "Correction orthographique activée (anglais)"
    let s:spell_check = 1
    setlocal spell spelllang=en
  else
    echo "Correction orthographique désactivée"
    let s:spell_check = 0
    setlocal spell spelllang=
  endif
endfunction
" mapping français
noremap  <F3> :call <SID>spell_fr()<CR>
inoremap <F3> <C-o>:call <SID>spell_fr()<CR>
vnoremap <F3> <C-o>:call <SID>spell_fr()<CR>
" mapping English
noremap <F4> :call <SID>spell_en()<CR>
inoremap <F4> <C-o>:call <SID>spell_en()<CR>
vnoremap <F4> <C-o>:call <SID>spell_en()<CR>


" http://nvie.com/posts/how-i-boosted-my-vim/
fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

noremap <F2> :call <SID>ToggleMouse()<CR>
inoremap <F2> <C-o>:call <SID>ToggleMouse()<CR>
vnoremap <F2> <C-o>:call <SID>ToggleMouse()<CR>


set pastetoggle=<F5>

noremap <F6> :match Ignore /\r$/<CR>
inoremap <F6> :match Ignore /\r$/<CR>
vnoremap <F6> :match Ignore /\r$/<CR>

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" title tmux
if &term == "screen"
  set t_ts=k[
  set t_fs=]\
endif
if &term == "screen" || &term == "xterm"
  set title
endif
