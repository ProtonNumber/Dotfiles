import XMonad

import Data.Maybe(isJust)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.SetWMName

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce

import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders

import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8
import qualified XMonad.StackSet as W

import System.Taffybar.Support.PagerHints (pagerHints)

willFloat::Query Bool
willFloat = ask >>= \w -> liftX $ withDisplay $ \d -> do
  	sh <- io $ getWMNormalHints d w
  	let isFixedSize = isJust (sh_min_size sh) && sh_min_size sh == sh_max_size sh
  	isTransient <- isJust <$> io (getTransientForHint d w)
  	return (isFixedSize || isTransient)

main :: IO ()
main = do
	xmonad $ fullscreenSupport $ ewmh $ docks $ pagerHints $ myConfig

myConfig = def
	{ modMask = mod4Mask
	, layoutHook = myLayout
	, manageHook = myManageHook
	, startupHook = startup
	, terminal = "alacritty"			-- I dunno what emulator it uses by default, but I hate it
	, workspaces = myWorkspaces
	, borderWidth = 3
	, normalBorderColor = "#1c1f26"
	, focusedBorderColor = "#3e4046"
	}
	`additionalKeysP`
	[ ("M-S-s", unGrab *> spawn "scrot -s -e 'xclip -selection clipboard -t image/png -i $f && rm $f'")		-- Take a screenshot of an area
	, ("M-C-s", unGrab *> spawn "scrot -e 'xclip -selection clipboard -t image/png -i $f && rm $f'")
	, ("M-w", kill)							-- Close windows
	, ("M-r", spawn ".config/rofi/launchers/ribbon/launcher.sh")	-- Run launcher
	, ("M-p", spawn ".config/rofi/powermenu/powermenu.sh")		-- Run power menu
	, ("M-S-l", spawn "dm-tool lock")
	]

startup = do
	spawnOnce "taffybar"
	setWMName "LG3D"

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myLayout = fullscreenFull $ avoidStruts $ smartBorders ( tiled ||| Mirror tiled ||| Full )
	where
		tiled = Tall nmaster delta ratio
		nmaster = 1
		ratio = 2/3
		delta = 3/100

myManageHook = composeAll
	[ title =? "Select a rocket motor" --> doFloat
	, fmap not willFloat --> insertPosition End Newer
	]
