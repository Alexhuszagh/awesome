# Awesome Configuration

## Acknowledgements

* This theme is a fork from [Powerarrow] (https://github.com/esn89/powerarrow) from user @esn89
* I use the GTK stylings from @vincentbernat's [Awesome Configuration] (https://github.com/vincentbernat/awesome-configuration)

## Install

#### Instructions are for Ubuntu 15.04

* Install Awesome Window Manager
    ```shell
    # apt-get install awesome awesome-extr
    ```

* Download files and copy to ~/.config/awesome, so the load path for rc.lua is ~/.config/awesome/rc.lua
* Edit the awesome/private.lua file
    * Change location to your nearest 4 digit area code for an airport found from [here] (http://weather.noaa.gov/)
    * Change the audio depending on whether you use pulse or alsa-supported codec.
    * Change the battery to the value given here
    ```shell
    ls /sys/class/power_supply/ | grep BAT
    ```

* Run in awesome mode.
* Everything should be generic for your system, but many of the installed applications, etc. are not standard (such as scientific software). Install what you want, but I do not recommend using this configuration.
* I also use the Ambiance-Dark-Blue GTK theme from NoobsLab, which can be installed from their Ubuntu PPA.
    ```
    sudo add-apt-repository ppa:noobslab/themes
    sudo apt-get update
    sudo apt-get install ambiance-dark-blue
    ```

* I use a split URxvt/Tilda for my dropdown terminals
    * Other installs required:
    ```shell
    $ ## xsel for URxvt clipboard // URxvt
    $ sudo apt-get install xsel rxvt-unicode-256color
    $ ## Perl functions for copy/paste
    $ git clone https://github.com/muennich/urxvt-perls.git
    $ sudo cp urxvt-perls/* /usr/lib/urxvt/perl/
    $ ## Now tools for the dropdown terminals (tdrop)
    $ sudo apt-get install xdotool
    $ git clone https://github.com/angelic-sedition/tdrop.git
    $ cd tdrop
    $ sudo make install
    ```

## Other Notes

* Configured to work with pulseaudio or an alsa-supported codec.
* Has a custom bottom panel that acts like a dock.
    * Auto-hides, auto-shows upon mouse-entry on the bottom of the screen.
    * Can be manually configured to lock visible or hidden.
* Edited naughty/notify to enable custom tooltips above the cursor
* Use 3 terminal sets -- gnome-terminal, urxvt, and tilda
    * gnome-terminal as the core terminal, full screen and locked to a tag.
    * urxvt as a tiled, dropdown terminal.
    * tilda as a floating, fixed-size, dropdown terminal.

![Image of tooltip]
(http://i.imgur.com/MhZdHD9.png)

## Images

The rest of the of the configuration files can be found in my settings for [Conky] (https://github.com/Alexhuszagh/conky) and [Dot Files] (https://github.com/Alexhuszagh/dotfiles).

![Image of functionning dock]
(http://i.imgur.com/auyIM0A.png)
![Image of tiled and floating dropdown terminals]
(http://i.imgur.com/ZqAPFi4.png)
