# Copyright 2014 Frey Alfredsson
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# Theme based on a theme by Helgi Kristvin Sigurbjarnarson

PROMPT='[%{$fg[yellow]%}%n@%m%{$reset_color%} %{$fg[red]%}$(zsh ~/.oh-my-zsh/path.zsh -l -t)%{$reset_color%}] $(git_prompt_info)%{$reset_color%}'$'\n$ '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

