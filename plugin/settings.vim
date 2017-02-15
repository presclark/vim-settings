nmap ,s <esc>:update<cr>
imap ,s <esc>:update<cr>
vmap ,s <esc>:update<cr>

map <F11> <esc>:NERDTreeToggle<cr>
map <F12> <esc>:Bufferlist<cr>
map <Leader>t <esc>:CtrlP<cr>

let g:ctrlp_root_markers = ['.ctrlp', '.git', '.root', '.editorconfig']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](.git|.hg|.svn|bin|obj)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

set termguicolors
set ignorecase          " Case insensitive matching.
set nowrap
set noerrorbells        " No beeps.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set hlsearch            " Highlight search matches.
set autowrite           " Automatically save before :next, :make etc.
set hidden
set nostartofline       " Do not jump to first character with page commands,
set lz " Do not redraw when running macros... lazy redraw
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
set nobackup
set nowb
set noswapfile
set wildmode=list:longest " Path/file expansion in colon-mode.
set wildignore=*.o,obj,*.exe,*.pyc,*.swp,*.zip,*.dll,concrete*,vendor*,node_modules*,min*,img*,laravel*,files*,markup*,doctrine*,ignore*
set wildchar=<TAB>

if exists('+colorcolumn')
	highlight ColorColumn ctermbg=66
	" set colorcolumn=100
	" set wrapmargin=100
endif

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

