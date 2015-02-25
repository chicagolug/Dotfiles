dotfiles
========

Dotfiles because I was sick of flipping carrying around different versions of my .zshrc across six or seven places during/after I graduated college.

I use rcm, which is why there's folders for things like 'hooks' and host-specific directories (anything in one of them goes into the location on the host). Setting up a new machine is as simple as installing rcm, installing git, making sure it's running reasonable versions of tmux, vim, zsh, and/or emacs, and doing a `git clone <repo> .dotfiles && rcup`. The hook (hooks/post-up) runs after everything has been symlinked for the first time, and mostly installs vundle, the various vim plugins, and the various tmux plugins available now that tmux supports plugins.

Emacs
-----

Emacs is a pretty basic install. I mostly use it for cider-mode, because I'm a slave to vim's CtrlP plugin for navigating source across large repos (like I do at work all day). There's a pretty boring emacs.d/init.el file, which sets the custom-file (where GUI customizations and such happen) to ~/.emacs.d/custom.el, which is also checked into source on a machine-by-machine basis.

Vim
---

The .vimrc is intended to be standalone. It sets some basic stuff up (syntax highlighting, letting it know that .md files are always going to be markdown files for me), but doesn't have any external dependencies if I did it right.
The .vimrc.bundles is the heart of my configuration, where all the external packages are loaded and have their various keybindings and options set up.
The split is helpful because on certain machines (servers, etc) I don't want to copy and paste my entire .vim directory over or be installing random stuff from the internet, but I still want things like mouse support.

Tmux
----

My tmux config was stolen from @mrdaemon after an IRC conversation about how tmux is so much better and me stating that I didn't want to relearn all of my GNU screen-based muscle memory.

It does things like enabling 256-color and UTF8 modes by default, changing the prefix from C-b to C-a, using C-ah and C-av to split panes instead of the esoteric ones they have, setting a custom statusbar, and using HJKL motion for moving and selecting panes.
More importantly, it includes the plugins tmux-resurrect and tmux-yank, which is essential for a Mac user and handy under Linux. Tmux-yank allows you to copy text into the system clipboard using tmux's copy mode (I know, right?) and is probably the single part of tmux I use most often. In an app that won't stop outputting things and getting frustrated with trying to select something from the scrollback with your terminal's stupid 'auto-scroll to the bottom on new output' feature? Enter copy mode, select it, and yank it and it's ready to be pasted wherever it needs to go.

Zsh
---

Zsh is one of those things where I didn't realize how much I took it for granted until I started having to log into servers without it. I'm a big user of zsh, mostly because it allows me to type the beginning of what I mean and hit tab until the right command line is there. I make typos frequently, and the soft matching zsh provides is incredibly convenient.
This .zshrc has followed me around since community college, through college (where it existed on both the CS machines and the engineering machines, with weird paths for both, and had to work with both linux and Solaris on SPARC) across half a dozen hosts through two jobs. It automatically runs ls every time I enter a directory if it'll fit nicely in the window, it autocompletes ssh and scp hosts based on my known_hosts file, it loads pyenv and rvm (and rbenv, which I use at home instead of rvm). Most of the loading of things (keychain, rvm, rbenv, etc) is guarded based on the files required existing. I noticed that my fancy, colorful prompt that ended in a % was confusing emacs's tramp (the ability to edit files seamlessly over ssh as though they were on your machine), which is why there's that ugliness on line 190.
