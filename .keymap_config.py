import re
from xkeysnail.transform import *

define_multipurpose_modmap(
    {Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]}
)

define_keymap(None, {
    K("M-h"): K("left"),
    K("M-l"): K("right"),
    K("M-k"): K("up"),
    K("M-j"): K("down")
})

    
