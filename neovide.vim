if exists("g:neovide")
  let g:neovide_remember_window_size = v:true
  let g:neovide_cursor_animation_length=0.1
  let g:neovide_cursor_trail_size = 0.1
  let g:neovide_cursor_antialiasing = v:false
  let g:neovide_cursor_vfx_mode = "pixiedust"
  let g:neovide_hide_mouse_when_typing = v:true
  " let g:neovide_transparency = 0.8
  " let g:transparency = 0.9
  let g:neovide_underline_automatic_scaling = v:true
  let g:neovide_refresh_rate = 75
  " let g:neovide_fullscreen = v:true
  let g:neovide_profiler = v:true
  set guifont=JetBrainsMono\ NF:h13

  nnoremap p "+p
endif

let g:gitblame_enabled = 0
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
nnoremap < <<
nnoremap > >>
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap Q :norm @q<CR>
