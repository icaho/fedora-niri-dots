# alias nexmo-prod='aws-gen-creds --profile nexmo-prod -a arn:aws:iam::920763156836:role/vgr-admin'
# alias nexmo-dev='aws-gen-creds --profile nexmo-dev -a arn:aws:iam::564623767830:role/vgr-admin'
# alias vpn-up='nmcli c up lendable-vpn'
# alias vpn-down='nmcli c down lendable-vpn'
alias ssh='TERM=xterm ssh'
alias ave="aws-vault exec"
alias av="aws-vault"
alias avl="aws-vault login"
alias cls="clear"

alias avd='f() {unset AWS_VAULT && aws-vault exec $1 -d 8h /bin/zsh};f'