if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr k "kubectl"
    abbr kgp "kubectl get pods"
    abbr kg "kubectl get"
    abbr kga "kubectl get all"
    abbr keti "kubectl exec -it"
    abbr dc "docker-compose"
    abbr p "pnpm"

    abbr gprv "gh pr view -w"

    alias vim "nvim"
    alias vi "nvim"
    alias v "nvim"
    alias l "ls -algh"

    starship init fish | source
    direnv hook fish | source
    bind \cf '~/.local/bin/tmux-sessionizer'
end


