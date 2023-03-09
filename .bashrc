#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



alias ls='ls --color=auto'
alias tree='tree -C'
alias la='ls -A'
alias timidity='timidity -OO'
alias mountRome='sudo mount -t nfs 192.168.1.52:/mnt/main_1/Media'
alias ascii-image-converter='export COLORTERM=COLORTERM=truecolor; ascii-image-converter'
PS1='[\u@\h \W]\$ '
export PATH=”$HOME/.local/bin:$HOME/.emacs.d/bin:$PATH”



# >>> conda initialize >>>

techpriest() {
	ffmpeg -f lavfi -i aevalsrc="'sin(8*t*ceil(10*(sin(t*0.5)+2*sin(t)+1.5*sin(2*t)+3*sin(3*t)+sin(5*t))))'" -f matroska - | ffplay 
}


switch_conda () {
	# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jacopo/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jacopo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jacopo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jacopo/anaconda3/bin:$PATH"
    fi
fi

unset __conda_setup
# <<< conda initialize <<<
}

#Create gridpp proxy

grid_proxy() {
        #on SL7 (CentOS7):
        source /cvmfs/grid.cern.ch/umd-c7ui-latest/etc/profile.d/setup-c7-ui-example.sh
        voms-proxy-init -voms lz
}

monitor() {
	xrandr --output VGA-1 --auto --above LVDS-1
	xrandr --output HDMI-1 --mode 1920x1080 --rotate right --left-of VGA-1
}

showimg() {
	printf '\033]20;'${PWD}/$1';'$2'x100+50+50:op=keep-aspect\a'
}
clearimg() {
	printf '\033]20;;100x100+1000+1000\a'
}


# display() {
# 	gpg --output "tmp.meme" -d "$1"
#     open "tmp.meme"
#     rm -f "tmp.meme"
# }

display() {
	gpg -d "$1" | imv -
}


if pgrep ssh-agent > /dev/null ; then
	:
else
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
