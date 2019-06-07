if !has("python3")
    echo "vim has to be compiled with +python3 to run this"
    finish
endif

if exists('g:QB_plugin_loaded')
    finish
endif

let g:QB_plugin_loaded = 1
let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import QB

EOF

function! Get_country()
        py3 print(QB.get_country())
endfunction

command! -nargs=0 PrintCountry call Get_country()


function! InsertCountry()
        py3 QB.insert_country()
endfunction

command! -nargs=0 InsertCountry call InsertCountry()

nnoremap <leader>c :call InsertCountry()<cr>


function! QB()
        py3 QB.QB()
endfunction

command! -nargs=0 QB call QB()

nnoremap <leader>Q :call QB()<cr>


