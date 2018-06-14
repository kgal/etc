#!/bin/zsh
function my-accept-line() {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
	echo 
	if [ "$IS_LONG" = "LONG" ]; then
	    ls -l
	    IS_LONG=CLEAR
	elif [ "$IS_LONG" = "CLEAR" ]; then
	    clear
	    IS_LONG=SHORT
	else
	    ls 
	    IS_LONG=LONG
	fi
	echo -n "$(pwd)% "
    else
	# in any case run the `accept-line' widget
	zle accept-line
    fi
}
# create a widget from `my-accept-line' with the same name
zle -N my-accept-line
# rebind Enter, usually this is `^M'
bindkey '^M' my-accept-line


# If this hasn't been already run...
if [[ ! "$PATH" = "*$HOME/etc/local/exe*" ]]; then
    # For all linked (and regular) directories under ~/etc/local
    # run through them and find every file named 'bin' and add
    # that to the PATH
	PATH+=$(find -L ~/etc/local/exe -type d -name bin -printf ":%p")
fi
export LD_LIBRARY_PATH
# If this hasn't been already run...
if [[ ! "$LD_LIBRARY_PATH" = "*$HOME/etc/local/lib*" ]]; then
    # For all linked (and regular) directories under ~/etc/local
    # run through them and find every file named 'bin' and add
    # that to the PATH
	LD_LIBRARY_PATH+=$(find -L ~/etc/local/lib -type d -name lib -printf ":%p")
fi



autoload promptinit
promptinit
prompt clint
prompt bart

export DYNINSTAPI_RT_LIB=/usr/lib64/dyninst/libdyninstAPI_RT.so


