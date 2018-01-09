export HISTFILESIZE=9000000
export HISTSIZE=9000000
export PROMPT_COMMAND='history -a'
# .bashrc
#alias vim=vimx
#export PATH="/Users/adomurad/luajit-2.0/src/:$PATH"
#alias python=python3
#alias pip=pip3
#alias catedit='echo "NOT NOW"' #node /Users/adomurad/sources/catedit/catedit.js'
alias catedit='node /Users/adomurad/sources/catedit/catedit.js'
#export PYTHONDONTWRITEBYTECODE=1

alias node6='/Users/adomurad/node-v6.9.2-linux-x64/bin/node'
function grepedit() {
    args=$@
    node /Users/adomurad/sources/catedit/catedit.js `grep -Ril "$args"`
}

function r() {
    dir="`pwd`"
    cd ~/CS842-ToyVM/
    ./run.sh $@
    cd "$dir"
}

#Use ccache by default
if [ -e /usr/lib/ccache ]; then 
	export PATH=/usr/lib/ccache:$PATH
fi
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function rsed() {
    gfind . -type f -print0 | xargs -0 sed -i $@
}

function open() {
        python ~/sources/getfilename.py | tee /dev/tty | xargs -o vim
}

function cato() {
        python ~/sources/getfilename.py | tee /dev/tty | xargs -o node /Users/adomurad/sources/catedit/catedit.js
}

function trim() {
	sed -e 's/^ *//g' -e 's/ *$//g'
}

alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
alias sublime='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'

alias dielanarts='for i in 2 9 ; do pkill "-$i" lanarts ; sleep 1 ; done'

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
alias pygrep="gfind . -name '*.py' ! -path './env/*' ! -path './env/*' ! -path './.git/*' -print | xargs grep"
#alias jsgrep="gfind . -name '*.js' -o -name '*.jsx' -o -name '*.html' -o -name '*.css' ! -path './env/*' ! -path './env/*' ! -path './.git/*' -print | xargs grep"
alias jsgrep="gfind . \( -name '*.js' -o -name '*.jsx' -o -name '*.html' -o -name '*.css' \) ! -path '*/node_modules/*' ! -path '*.min.*' ! -path './env/*' ! -path './env/*' ! -path './.git/*' -print | xargs grep"

alias find="gfind"
#alias xargs="gxargs"

export CLICOLOR=1
export NGROK_SUBDOMAIN=dev37
export WEB_ROOT="https://$NGROK_SUBDOMAIN.ngrok.io"
export PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]'
export FZF_DEFAULT_COMMAND="gfind . \( -name '*.py' -o -name '*.js' -o -name '*.jsx' -o -name '*.html' -o -name '*.css' \) ! -path '*/node_modules/*' ! -path '*.min.*' ! -path './env/*' ! -path './env/*' ! -path './.git/*'"

function git_push_as() {
    branch=$1
    git branch "$branch"
    git push -u origin "$branch"
}
function git_push_as_f() {
    branch=$1
    git branch -f "$branch"
    git push -u origin "$branch"
}

export NGROK_SUBDOMAIN="dev37"
export WEB_ROOT="https://$NGROK_SUBDOMAIN.ngrok.io"

export PYTHONDONTWRITEBYTECODE=1

export PATH="$PATH:/Users/adomurad/Library/Python/2.7/bin"

