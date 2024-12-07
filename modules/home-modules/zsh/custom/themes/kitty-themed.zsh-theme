# Put your custom themes in this folder.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-themes
#
# Example:

if [ $IN_NIX_SHELL ]; then
    NIX_SHELL_PROMPT_EXTRA="[Nix SH]"
fi

PROMPT="%n at %m in %~ "
RPROMPT="$NIX_SHELL_PROMPT_EXTRA"
#%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%
