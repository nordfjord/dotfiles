set -x GOPATH $HOME/.local/share/gobin
fish_add_path /usr/local/bin
fish_add_path $HOME/Library/pnpm
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.linkerd2/bin
fish_add_path $HOME/.asdf/shims
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/share/gobin/bin
set fish_user_paths ./node_modules/.bin $fish_user_paths 

