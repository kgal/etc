#!/bin/zsh
function my-accept-line() {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
	echo 
	if [ "$IS_LONG" = "LONG" ]; then
	    ls -l
	    IS_LONG=SHORT
	else
	    ls 
	    IS_LONG=LONG
	fi
	echo -n "% "
    else
	# in any case run the `accept-line' widget
	zle accept-line
    fi
}
# create a widget from `my-accept-line' with the same name
zle -N my-accept-line
# rebind Enter, usually this is `^M'
bindkey '^M' my-accept-line