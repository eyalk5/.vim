setlocal et sw=4 ts=4
map <expr><buffer> ]] repmo#Key('<plug>(PythonsenseStartOfNextPythonClass)', '<plug>(PythonsenseStartOfPythonClass)')|sunmap <buffer> ]]
map <expr><buffer> [[ repmo#Key('<plug>(PythonsenseStartOfPythonClass)', '<plug>(PythonsenseStartOfNextPythonClass)')|sunmap <buffer> [[
map <expr><buffer> ][ repmo#Key('<plug>(PythonsenseEndOfPythonClass)', '<plug>(PythonsenseEndOfPreviousPythonClass)')|sunmap <buffer> ][
map <expr><buffer> [] repmo#Key('<plug>(PythonsenseEndOfPreviousPythonClass)', '<plug>(PythonsenseEndOfPythonClass)')|sunmap <buffer> []
map <expr><buffer> ]m repmo#Key('<plug>(PythonsenseStartOfNextPythonFunction)', '<plug>(PythonsenseStartOfPythonFunction)')|sunmap <buffer> ]m
map <expr><buffer> [m repmo#Key('<plug>(PythonsenseStartOfPythonFunction)', '<plug>(PythonsenseStartOfNextPythonFunction)')|sunmap <buffer> [m
map <expr><buffer> ]M repmo#Key('<plug>(PythonsenseEndOfPythonFunction)', '<plug>(PythonsenseEndOfPreviousPythonFunction)')|sunmap <buffer> ]M
map <expr><buffer> [M repmo#Key('<plug>(PythonsenseEndOfPreviousPythonFunction)', '<plug>(PythonsenseEndOfPythonFunction)')|sunmap <buffer> [M
