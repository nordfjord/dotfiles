if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr k "kubectl"
    abbr kgp "kubectl get pods"
    abbr kg "kubectl get"
    abbr kga "kubectl get all"
    abbr keti "kubectl exec -it"
    abbr dc "docker-compose"
    abbr p "pnpm"
    abbr bb "bunx"

    abbr gprv "gh pr view -w"

    alias vim "nvim"
    alias vi "nvim"
    alias v "nvim"
    alias l "ls -algh"

    starship init fish | source
    direnv hook fish | source
    bind \cf '~/.local/bin/tmux-sessionizer'
    set -x EDITOR nvim
end



# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/nordfjord/.opencode/bin
