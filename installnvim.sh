#!/bin/bash - 
#===============================================================================
#
#          FILE: installnvim.sh
# 
#         USAGE: ./installnvim.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 10/21/2019 19:01
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
exit_on_error() {
    exit_code=$1
    last_command=${@:2}
    if [ $exit_code -ne 0 ]; then
        >&2 echo "\"${last_command}\" command failed with exit code ${exit_code}."
        exit $exit_code
    fi
}
echo "usage: new-version-zip-filename (ie nightly)" 
rm nvim-macos.tar.gz
wget https://github.com/neovim/neovim/releases/download/$1/nvim-macos.tar.gz
exit_on_error()
if [ -d nvim-temp ]; then
    echo "moving temp to last temp" 
    rm -rf ./neovim-lasttemp
    mv nvim-temp nvim-lasttemp
fi

mv nvim-osx64 nvim-temp
tar -vzxf nvim-macos.tar.gz
#mv $2 nvim-osx64
