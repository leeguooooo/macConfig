alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias n='nvim'
alias q='nvim'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# chencheng
alias ,ms="%PATH/TO/MY/SCRIPT%"
alias ,ip="ipconfig getifaddr en0"
alias ,sshconfig="vim ~/.ssh/config"
alias ,gitconfig="vim ~/.gitconfig"
alias ,cip="curl ipinfo.io/json"
alias b=",ms branch"
# chore
alias br="bun run"
alias c='code .'
alias i='webstorm .'
alias cdtmp='cd `mktemp -d /tmp/leeguoo-XXXXXX`'
alias pi="echo 'Pinging Baidu' && ping www.baidu.com"
alias ip="ipconfig getifaddr en0 && ipconfig getifaddr en1"
alias cip="curl cip.cc"
alias qr='qrcode-terminal'
alias ee="stree"
alias hosts="vi /etc/hosts"
## system
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"
# cd
alias ..='cd ../'
alias ...='cd ../../'
alias ..l.='cd ../../; and ll'
alias ....='cd ../../../'
# alias ~="cd ~"
# alias -- -="cd -"
alias ll='ls -alh --color=auto'
alias ls='ls --color=auto'
# git
# alias git=hub
# alias gp="git push"
# alias gt="git status -sb"
# alias ga="git add ."
# alias gc="git commit -av"
# alias gcr="git checkout master && git fetch && git rebase"
# alias gclean="git reset --hard && git clean -df"
# alias grebase="git fetch && git rebase -i"


if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source


thefuck --alias | source

# set -gx https_proxy http://127.0.0.1:33210
# set -gx http_proxy http://127.0.0.1:33210
# set -gx all_proxy socks5://127.0.0.1:33211

function gm
    set current_branch (git symbolic-ref --short -q HEAD)
    set_color --bold

    if test "$current_branch" = "master"
        set_color red
        echo "Error: You are already on the 'master' branch. Please switch to the branch you want to update."
        set_color normal
        return 1
    end

    if git status -s | grep -q . # Check for uncommitted changes
        set_color red
        echo "Error: You have uncommitted changes. Please commit or stash them before updating the branch."
        set_color normal
        return 1
    end

    set_color green
    echo "Updating branch '$current_branch' with the latest changes from 'master' branch..."
    set_color normal

    git checkout master

    if not git pull upstream master
        set_color red
        echo "Error: Failed to pull latest changes from upstream master. Please check your network connection and upstream repository."
        set_color normal
        git checkout $current_branch
        return 1
    end

    git checkout $current_branch

    if not git merge master
        set_color red
        echo "Error: Merge conflict encountered. Please resolve the conflicts and complete the merge manually."
        set_color normal
        return 1
    end

    set_color green
    echo "Branch '$current_branch' has been successfully updated with the latest changes from 'master' branch."
    set_color normal
end


if status is-interactive
    pyenv init - | source
end

eval (python3 -m virtualfish)

# pnpm
set -gx PNPM_HOME "/Users/zhihu/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by Windsurf
fish_add_path /Users/zhihu/.codeium/windsurf/bin
