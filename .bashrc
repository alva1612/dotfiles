# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc


# Load Angular CLI autocompletion.
source <(ng completion script)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# AGREGADO POR ALVARO
#-----------------ALIASES------------------#
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# #################XDG VARIABLES###########3
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

#---------------------ENV VARIABLES-----------------#
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export LEIN_HOME="$XDG_DATA_HOME/lein"
export HISTFILE="$XDG_STATE_HOME/bash/history"



##############TERMINAL PROMPT############3
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo " (${BRANCH} ) "
	else
		echo ""
	fi
}
END_COLOR='\[\e[0m\]'
END_LINE='\e[0m\]'
USER_COLOR='\[\e[0;1;38;5;214m\]'
HOST_COLOR='\[\e[0;2m\]'
DIR_COLOR='\[\e[0;1;38;5;44m\]'
GIT_COLOR='\[\e[0;1;93m\]'
export PS1="$USER_COLOR\u@$END_COLOR$HOST_COLOR\h$END_COLOR $DIR_COLOR\W$END_COLOR $GIT_COLOR\`parse_git_branch\`\$ $END_COLOR"
