augroup filetypedetect
	au BufNewFile,BufRead *.aadl	setf aadl
augroup END
augroup filetypedetect
	au BufNewFile,BufRead *.lus	setf lustre
augroup END
augroup filetypedetect
	au BufNewFile,BufRead CMake*	setf cmake
augroup END
augroup filetypedetect
	au BufNewFile,BufRead *.cl	setf opencl 
augroup END
augroup filetypedetect
	au BufNewFile,BufRead *.page	setf markdown
augroup END
augroup filetypedetect
	au BufNewFile,BufRead *.sls	setf yaml
augroup END
