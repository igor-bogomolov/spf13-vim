
set wildignore+=*.ko,*.mod.c,*.order,modules.builtin,*.o,*.obj

"augroup linuxsty
	" autocmd FileType c call s:LinuxFormatting()
	" autocmd FileType c call s:LinuxKeywords()
	" autocmd FileType c call s:LinuxHighlighting()
	" autocmd FileType diff,kconfig setlocal tabstop=8
"augroup END

function! s:LinuxFormatting()
	setlocal tabstop=8
	setlocal shiftwidth=8
	setlocal textwidth=80
	setlocal noexpandtab

	setlocal cindent
	setlocal formatoptions=tcqlron
	setlocal cinoptions=:0,l1,t0,g0
endfunction

function! s:LinuxKeywords()
	syn keyword cOperator likely unlikely
	syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
endfunction

function! s:LinuxHighlighting()
	highlight default link ExtraWhitespace ErrorMsg

	" Show trailing whitespace and spaces before a tab:
	match ExtraWhitespace /\s\+$\| \+\ze\t/
	"syntax match ExtraWhitespace /.\%>81v/ " virtual column 81 and more

	set list "show whitespace
	set listchars=tab:>-,trail:.
endfunction

function! LinuxCodeStyle()
	call s:LinuxFormatting()
	call s:LinuxKeywords()
	call s:LinuxHighlighting()
endfunction
