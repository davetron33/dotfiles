# what the ever loving hell is this path, dave?
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/davetron/Library/Python/3.8/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/usr/local/go/bin:/Users/davetron/.cargo/bin:/Applications/iTerm.app/Contents/Resources/utilities:/Users/davetron/love2d

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias cat="bat"
alias ls="tree -LCpah 1"
alias n="nvim"
alias nf='nvim $(fzf -m --preview="bat --color=always {}")'
alias fzf='fzf --preview="bat --color=always {}"'

alias pyenv="python3 -m venv ./venv"
alias pyexec="source venv/bin/activate"

alias nconf="n ~/.config/nvim"
alias zconf="n ~/.zshrc"
alias tmuxconf="n ~/.tmux.conf"

alias yt-audio="yt-dlp -x --audio-format mp3 --ffmpeg-location /opt/homebrew/bin/ffmpeg"
alias icloud="open /Users/davetron/Library/Mobile\ Documents/com~apple~CloudDocs"

LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '

SHOW_AWS_PROMPT=false

# fzf settings
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {} | head -200'"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
source ~/fzf-git.sh/fzf-git.sh

#qr codes lol
function qrcode() {
  local input="$*"
  [ -z "$input" ] && local input="@/dev/stdin"
  curl -d "$input" https://qrcode.show 
}

eval "$(zoxide init zsh)"

#fixes annoying golang trailing % for non trailing newlines
PROMPT_EOL_MARK=''
