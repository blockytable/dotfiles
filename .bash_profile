#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# Created by `pipx` on 2025-03-08 20:47:47
export PATH="$PATH:/home/hosni/.local/bin"

export QT_QPA_PLATFORMTHEME=qt6ct
