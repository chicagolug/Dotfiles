# Vim

My vim dotfiles are in [codersquid/vimdots](https://github.com/codersquid/vimdots)

These are crufty. I've not cleaned them up in a while.


* I'm using [pathogen](https://github.com/tpope/vim-pathogen) for a package manager
  There are new package managers but my dotstuff predates them. be sure to evaluate all the
  package managers and don't default to pathogen. see which one fits you.

my vim [bundles](https://github.com/codersquid/vimdots/tree/master/bundle)

I use these more than others
* [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
* [nerdtree](https://github.com/scrooloose/nerdtree) with `nmap ,n :NERDTreeToggle<CR>`
* [pyflakes-vim](https://github.com/kevinw/pyflakes-vim)
* [taglist](http://vim-taglist.sourceforge.net/) with `nmap ,t :TlistToggle<cr>`
* [ack](https://github.com/mileszs/ack.vim)


No tabs, (but I didn't break Makefiles?)

```
set shiftwidth=4
set tabstop=4
set expandtab
```

I prefer only 2 spaces for xml types of things. my settings aren't
perfect because the initial indent still screws up sometimes.

```
autocmd FileType ant,xml,html,js,css,xsd,tex set tabstop=2
autocmd FileType ant,xml,html,js,css,xsd,tex set shiftwidth=2
```

# Shell

I had some bash stuff that would make a special git prompt. but lately I've
been trying out [ohmyz](http://ohmyz.sh/) and stopped maintaining my gitprompt
shell. I get a git prompt from it. I have a prompt theme based on kennethreitz but
it includes virtualenv information.

I don't do much fancy. I like these aliases.

```
alias more='less'
alias vi='vim'
alias l.='ls -FGd .*'
alias prettyjson='python -mjson.tool'
function ff() { find . -name '*'$1'*' ; }
function vifind() { find . -name '*'$1'*' -exec vim {} + ; }
```
# Misc

I really like [ack](http://beyondgrep.com/). It's not about dotfiles but is one
of the things I want to install immediately after setting up dot things.
I have a script that I don't like for setting up my dot things. I haven't found
a perfect thing for that yet.

# Demo

* I can show TlistToggle by interacting with django-rest-framework's mixin.py
* I can show NerdTreeToggle, bufexplorer, `l.`, `ff`, and `vifind` with this directory
