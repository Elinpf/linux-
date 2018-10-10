# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# 映射按键配置
#if [ -f $HOME/.Xmodmap ]; then
  #/usr/bin/xmodmap $HOME/.Xmodmap
#fi

# 按键映射
# https://github.com/mooz/xkeysnail
if [ -f $HOME/.keymap_config.py ]; then
  nohup /usr/bin/xkeysnail $HOME/.keymap_config.py > /dev/null 2>&1 &
fi

# 科学上网
if [ -f $HOME/.shandowsocks_sslocl_config.json ]; then
  nohup sslocal -c $HOME/.shandowsocks_sslocl_config.json >/dev/null 2>&1 &
fi

mesg n || true
