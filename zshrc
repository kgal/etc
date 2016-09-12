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

if [[ ! "PATH" = "*$HOME/etc/local*" ]]; then
    find -L ~/etc/local -type d -name bin
fi

autoload promptinit
promptinit
prompt clint
prompt bart

PATH=$PATH:/home/eve/etc/local/scala.d/scala-2.11.8/bin
