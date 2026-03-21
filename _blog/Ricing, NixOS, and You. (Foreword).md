---
layout: blogpost
date: 2025-11-04
title: Ricing, NixOS, and You. (Foreword)
thumbnail: /assets/images/thumbnails/nixos_foreword.png
description: One man's journey through making everything share the same 8 or so colors.
tags:
  - blogpost
  - linux
  - ricing
  - nix
---
Has this ever happened to you? One day you're looking at the typical sad grey taskbar of your Windows ~~10~~ 11 computer (at the time of writing Microsoft killed Windows 10), trying to keep wallpaper engine from causing your entire desktop to crash, when all of a sudden you see some ones flashy Linux desktop for the first time? 

Two months later, you're fighting to figure out how to reinstall your login manager in the university dining hall since you accidentally just nuked `SDDM` while trying to purge a package that you thought was completely unrelated. Somewhat like a car guy who's up till 3 AM trying to fix his only ride to work tomorrow.

This is the typical Linux 'ricing' experience, especially if you run Arch. Then you finally get to the end, the dotfiles, the fancy WM (I use Hyprland because trendy), Jetbrains Mono Font(This site even uses it!), Transparent background, rounded borders etc...

 If you're familiar with this process already, you've tried GNU `stow`, for-looping `ln -s` at your `~/.config` folder, and everything else in between. It works, but it never feels **SOLID**. So what can we do? 

The easy answer would be just to do the aformentioned and live with it, but I would rather sink countless hours into solving a problem that takes 20 to 30 minutes of actual work to solve slightly quicker that do that. So naturally, I swapped to NixOS. 

So what is Nix/NixOS?

There are countless explanations on the differences between Nix the package manager, Nix the language, Nix the OS, and Nix the god of night, but I will give the simplest answer I can.

NixOS, is a GNU/Linux distribution that utilizes the Nix package manager as its main method of software installation, allowing for declarative, reproducible development environments and systems. The advantage of this is allowing you to have an entire system that can load your packages, dotfiles, and other configurations ready to deploy at a moments notice.

NixOS also does some cool stuff like creating different generations each time you make a change to the system, meaning if you make a change that includes something that breaks, simply reboot, select the last build from the `GRUB` menu, (that should be enabled by default unless you use systemd boot like a maniac) and wave your ability to actually use a reliable Linux system in front of your Arch friends in their gross, anime wallpaper lit faces. 

Jokes aside, stay tuned for a series of posts about my NixOS configuration, some of the choices I've made that may break typical Nix practices, and some good old fashioned declarative family fun.

