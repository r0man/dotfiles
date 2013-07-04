--
-- xmonad example config file for xmonad-0.9
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- NOTE: Those updating from earlier xmonad versions, who use
-- EwmhDesktops, safeSpawn, WindowGo, or the simple-status-bar
-- setup functions (dzen, xmobar) probably need to change
-- xmonad.hs, please see the notes below, or the following
-- link for more details:
--
-- http://www.haskell.org/haskellwiki/Xmonad/Notable_changes_since_0.8
--

import Data.List
import Data.Monoid
import Data.Ratio ((%))
import System.Exit
import XMonad
import XMonad.Actions.GridSelect
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Prompt
import XMonad.Prompt.Shell
import qualified Data.Map as M
import qualified XMonad.Actions.Search as S
import qualified XMonad.StackSet as W

myIconDir = "/home/roman/.xmonad/icons"

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
myTerminal = "urxvt +ls"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse = True

-- Width of the window border in pixels.
myBorderWidth = 1

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
myWorkspaces = ["1:Emacs","2:Web","3","4","5","6","7:Gimp","8:Chat","9:Media"]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#000000"

-- Promp style.
myXPConfig :: XPConfig
myXPConfig = defaultXPConfig {
  font = "xft:Terminus-10"
  , position = Bottom
  , bgColor = "#000000"
  , bgHLight = "#000000"
  , fgHLight = "#ffffff"
  , promptBorderWidth = 0
  , height = 20
}

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [
     -- launch a terminal
    ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Search the Google
    , ((modm             , xK_s     ), S.promptSearch myXPConfig S.google)

    -- Open GridSelect
    , ((modm, xK_g), goToSelected defaultGSConfig)

    -- Run a shell command
    , ((modm              , xK_p     ), shellPrompt myXPConfig)

    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- * NOTE: XMonad.Hooks.EwmhDesktops users must remove the obsolete
-- ewmhDesktopsLayout modifier from layoutHook. It no longer exists.
-- Instead use the 'ewmh' function from that module to modify your
-- defaultConfig as a whole. (See also logHook, handleEventHook, and
-- startupHook ewmh notes.)
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = onWorkspace "7:Gimp" gimpLayout $
           onWorkspace "8:Chat" chatLayout $
           standardLayouts
  where

    chatLayout = avoidStruts $ smartBorders $ withIM skypeRatio skypeRoster (tiled ||| reflectTiled ||| Grid) where

    gimpLayout = withIM (0.11) (Role "gimp-toolbox") $ reflectHoriz $ withIM (0.15) (Role "gimp-dock") Full

    -- Percent of screen to increment by when resizing panes
    delta = 3/100

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1/2

    reflectTiled = (reflectHoriz tiled)

    skypeRatio = (1%4)
    skypeRoster = (ClassName "Skype") `And` (Not (Title "Options")) `And` (Not (Role "Chats")) `And` (Not (Role "CallWindowForm"))

    standardLayouts = avoidStruts  $ (tiled ||| Mirror tiled ||| Full)

    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll . concat $
   [ [isFullscreen --> doFullFloat]
   , [isDialog --> doCenterFloat]
   , [ className =? "Emacs" --> doShift "1:Emacs"]
   , [ className =? "Chromium" --> doShift "2:Web"]
   , [ className =? "Firefox" --> doShift "2:Web"]
   , [ className =? "Gimp" --> doShift "7:Gimp"]
   , [ className =? "Skype" --> doShift "8:Chat" ]
   , [ className =? "Last.fm" --> doShift "9:Media" ]
   , [ className =? "Totem" --> doShift "9:Media" ]
   , [(className =? "Chromium" <&&> stringProperty "WM_WINDOW_ROLE" =? "pop-up") --> doCenterFloat]
   , [(className =? "Firefox" <&&> stringProperty "WM_WINDOW_ROLE" =? "About") --> doCenterFloat]
     -- using list comprehensions and partial matches
   , [ className =?  c --> doCenterFloat | c <- myCenterFloats ]
   , [ className =?  c --> doFloat | c <- myFloats ]
   , [ fmap ( c `isInfixOf`) className --> doFloat | c <- myMatchAnywhereFloatsC ]
   , [ fmap ( c `isInfixOf`) title     --> doFloat | c <- myMatchAnywhereFloatsT ]
   ]
   -- in a composeAll hook, you'd use: fmap ("VLC" `isInfixOf`) title --> doFloat
  where myFloats = ["Gajim.py", "Xmessage"]
        myCenterFloats = ["Gnome-volume-control", "Gcalctool", "Gnome-screenshot", "Gnome-system-monitor"]
        myMatchAnywhereFloatsC = ["Google","Pidgin"]
        myMatchAnywhereFloatsT = ["VLC"] -- this one is silly for only one string!

------------------------------------------------------------------------
-- Event handling

-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH event handling to your custom event hooks by
-- combining them with ewmhDesktopsEventHook.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH logHook actions to your custom log hook by
-- combining it with ewmhDesktopsLogHook.
--
myLogHook = fadeInactiveLogHook fadeAmount
          >> updatePointer (Relative 0.5 0.5)
          where fadeAmount = 0.8

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add initialization of EWMH support to your custom startup
-- hook by combining it with ewmhDesktopsStartup.
--
myStartupHook = do
              setWMName "LG3D"
              spawn "~/.dotfiles/dzen/top-right"
              spawn "~/.dotfiles/dzen/bottom"
              spawn "xcompmgr -C"

------------------------------------------------------------------------
-- Dzen
myDzenBar = "~/.dotfiles/dzen/top-left"
myDzenBarPP = dzenPP
            { ppCurrent  = dzenColor "#ffffff" "#54728e" . pad
            , ppVisible  = dzenColor "#484848" "#111111" . pad
            , ppHidden   = dzenColor "#484848" "#111111" . pad
            , ppHiddenNoWindows = const ""
            , ppUrgent   = dzenColor "red" "yellow" . dzenStrip
            , ppWsSep    = ""
            , ppSep      = ""
            , ppLayout   = dzenColor "#54728e" "#111111" .
              (\x -> case x of
                 "Full"                 -> "^i(" ++ myIconDir ++ "/full.xpm)"
                 "Mirror Tall"          -> "^i(" ++ myIconDir ++ "/mirror-tall.xpm)"
                 "Mirror ResizableTall" -> "^i(" ++ myIconDir ++ "/mtall.xpm)"
                 "Tall"                 -> "^i(" ++ myIconDir ++ "/tall.xpm)"
                 "ResizableTall"        -> "^i(" ++ myIconDir ++ "/tall.xpm)"
                 "Simple Float"         -> "~"
                 _                      -> pad x
              )
            , ppTitle    = ("^bg(#111111) ^fg(#ffffff)" ++) . dzenEscape }

-- Keybinding to toggle the gap for the status bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar myDzenBar myDzenBarPP toggleStrutsKey defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = defaultConfig {
  terminal           = myTerminal,
  focusFollowsMouse  = myFocusFollowsMouse,
  borderWidth        = myBorderWidth,
  modMask            = myModMask,
  workspaces         = myWorkspaces,
  normalBorderColor  = myNormalBorderColor,
  focusedBorderColor = myFocusedBorderColor,
  keys               = myKeys,
  layoutHook         = myLayout,
  manageHook         = myManageHook <+> manageDocks,
  handleEventHook    = myEventHook,
  logHook            = myLogHook,
  startupHook        = myStartupHook
}
