# DWLabel

![DWLabel icon](http://diwublog.com/wp-content/uploads/2012/02/Icon@2x.png)

## Overview

**DWLabel**, a subclass of UILabel capabel of touch events handling and displaying UIMenuController items. It's inspired by the UX of Weixin, the most popular mobile app in China developed by Tecent.

![screenshot](http://diwublog.com/wp-content/uploads/2012/02/Screen-Shot-2012-02-22-at-8.42.59-PM.png)

## How To Use

    DWLabel *tmpDWLabel = [[DWLabel alloc] initWithFrame:CGRectMake(18, 0, 260, 54)];
    self.dwLabel = tmpDWLabel;
    [tmpDWLabel release];

Make sure you also implement the **delete:** and **copy:** method within the DWLabel implemention file.

Run it, try long press the label. And you are good to go. ;)

Twitter: [@diwup](http://twitter.com/diwup)

Blog: [http://diwublog.com](http://diwublog.comp)
