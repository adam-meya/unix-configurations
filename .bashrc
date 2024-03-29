export HISTFILESIZE=9000000
export HISTSIZE=9000000
export PROMPT_COMMAND='history -a'
# .bashrc
alias catedit='node /Users/adomurad/sources/catedit/catedit.js'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function rsed() {
    gfind . -type f -print0 | xargs -0 sed -i $@
}

# command line shortcuts for apps
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
alias sublime='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'

# GNU utils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"

# typed find commands
alias pygrep="gfind . -name '*.py' ! -path './env/*' ! -path './env/*' ! -path './.git/*' -print | xargs grep --color"
alias jsgrep="gfind . \( -name '*.js' -o -name '*.jsx' -o -name '*.html' -o -name '*.css' \) ! -path '*/node_modules/*' ! -path '*.min.*' ! -path './env/*' ! -path './env/*' ! -path './.git/*' -print | xargs grep --color"
alias luagrep="gfind . \( -name '*.lua' -o -name '*.moon' \) ! -path '*/node_modules/*' ! -path '*.min.*' ! -path './env/*' ! -path './env/*' ! -path './.git/*' -print | xargs grep --color"
alias find="gfind"

# Colour in terminal
export CLICOLOR=1
# Colour in PS1 
export PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]'
# FZF for vim config
export FZF_DEFAULT_COMMAND="gfind . \( -name '*.py' -o -name '*.js' -o -name '*.jsx' -o -name '*.html' -o -name '*.css' \) ! -path '*/node_modules/*' ! -path '*.min.*' ! -path './env/*' ! -path './env/*' ! -path './.git/*'"

export PYTHONDONTWRITEBYTECODE=1

export PATH="$PATH:/Users/adomurad/Library/Python/2.7/bin"

