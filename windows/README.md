# Windows Config??!

In the brave new world of Windows Terminal, the shell on window, shockingly, doesn't suck total ass. I know, I'm as surprised as you are. 

I guess we're going to keep it simple for now - there's nothing quite like homeshick on windows. but it's definitely appealing that I can having a fuckin' quake style terminal that like, actually works.

So, as of today, i've landed on scoop as a package manager - seems to work fine.

there's even a dang ol' fzf

i think what we'll do for now is write a little powershell script to link relevant settings files to their proper places. i'm guessing that realistically using this stuff will still be waaaay less frequent than macos stuff. 

some bootstrapping required, including: 

## scoop

install scoop as per instructions on their site

`scoop-pkgs.json` is a dump of the scoop packages I have so far, which can apparently be used to re-inflate a system with worthy packages with `scoop import`.

## linking dotfiles
there ain't no homepwshick so i just have a `linkDotfiles.ps1` script, that does the work for us. 
