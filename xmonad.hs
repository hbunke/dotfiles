import XMonad
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Layout.NoFrillsDecoration
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W


main = xmonad  =<< xmobar myConfig

myConfig = defaultConfig
    {
        terminal = "roxterm"
	,   modMask = mod1Mask
	,   borderWidth = 3
--    , layoutHook = myL
    ,   logHook = dynamicLog
    ,   startupHook = myStartupHook
    ,   manageHook = myManageHook
    }

    `additionalKeys`
    [ ((mod1Mask, xK_F1), spawn "firefox")
        ,((mod1Mask, xK_F2), spawn "chromium")
        ,((mod1Mask, xK_Right), windows W.focusDown)
        ,((mod1Mask, xK_Left), windows W.focusUp)
    ]

--myL = noFrillsDeco shrinkText defaultTheme (layoutHook defaultConfig)
--
myManageHook = composeAll 
   [ role =? "pop-up" --> doFloat ]
   where
    role = stringProperty "WM_WINDOW_ROLE"


myStartupHook = do
    spawn "$HOME/bin/xrandr.sh"
    spawn "$HOME/bin/trayer.sh"


