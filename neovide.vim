if exists("g:neovide")
  let g:neovide_remember_window_size = v:true
  let g:neovide_cursor_animation_length=0.1
  let g:neovide_cursor_trail_size = 0.1
  let g:neovide_cursor_antialiasing = v:false
  let g:neovide_cursor_vfx_mode = "pixiedust"
  let g:neovide_hide_mouse_when_typing = v:true
  " set guifont=Iosevka:h12
  " set guifont=SauceCodePro\ NF:h11
  set guifont=FantasqueSansMono\ Nerd\ Font:h13
  " set foldmethod=expr
  " set foldexpr=nvim_treesitter#foldexpr()
endif

let g:gitblame_enabled = 0
nnoremap < <<
nnoremap > >>
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap Q :norm @q<CR>
