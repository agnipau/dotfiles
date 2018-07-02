/* 2bwm config file */


///---Modifiers---///
/* Super/Windows key or check xmodmap(1) with -pm defined in /usr/include/xcb/xproto.h */
#define MOD XCB_MOD_MASK_4


///---Speed---///
static const uint16_t movements[] = {
  20,  // move step slow, in pixels
  40,  // move step fast, in pixels
  15,  // mouse slow, in pixels
  400  // mouse fast, in pixels
};


///---Resize options---///
/* Resize by line like in mcwm -- jmbi */
static const bool resize_by_line = true;
/* The ratio used when resizing and keeping the aspect */
static const float resize_keep_aspect_ratio = 1.03;


///---Offsets---///
static const uint8_t offsets[] = {
  0, // offsetx (left side)
  0, // offsety (upper side)
  0, // maxwidth (right side (left side * 2))
  0  // maxheight (downer side (upper side * 2))
};


///---Colors---///
/* I wrote a script that generates a file containing pywal's colors to use in 2bwm, because pywal doesn't generate it natively */
#include "/home/matte/.cache/wal/colors-wal-2bwm.h"
/* If this is set to true the inner border and outer borders colors will be swapped */
static const bool inverted_colors = false;


///---Cursor---///
//#define CURSOR_POSITION TOP_LEFT
//#define CURSOR_POSITION TOP_RIGHT
//#define CURSOR_POSITION BOTTOM_LEFT
//#define CURSOR_POSITION BOTTOM_RIGHT
#define CURSOR_POSITION MIDDLE


///---Borders---///
static const uint8_t borders[] = {
  5, // outer border size. If you put this negative it will be a square
  7, // full borderwidth
  2, // nagnet border size
  3  // resize border size
};

/* Windows that won't have a border.
 * It uses substring comparison with what is found in the WM_NAME
 * attribute of the window. You can test this using `xprop WM_NAME`.
 */
#define LOOK_INTO "WM_NAME"
static const char *ignore_names[] = {"bar",
  "xclock",
  "feh",
  "mpv",
  "TelegramDesktop",
  "Chromium",
  "Viewnior",
  "Lxappearance",
};


///---Menus and Programs---///
static const char *menucmd[]       = {"", NULL};
static const char *screenshot[]    = {"/home/matte/bin/screenshot", NULL};
static const char *rec[]           = {"/home/matte/bin/rec", NULL};
static const char *norec[]         = {"/home/matte/bin/norec", NULL};
static const char *rofir[]          = {"/home/matte/bin/2bwm-programs-launcher", "-rofir", NULL};
static const char *rofiw[]          = {"/home/matte/bin/2bwm-programs-launcher", "-rofiw", NULL};
static const char *astd[]           = {"/home/matte/bin/2bwm-programs-launcher", "-astd", NULL};
static const char *astl[]           = {"/home/matte/bin/2bwm-programs-launcher", "-astl", NULL};
static const char *cstd[]           = {"/home/matte/bin/current-wal-dark", NULL};
static const char *cstl[]           = {"/home/matte/bin/current-wal-light", NULL};
static const char *draw[]          = {"/home/matte/bin/draw", NULL};
static const char *st[]            = {"st", NULL};
static const char *stfullscreen[]  = {"/home/matte/bin/2bwm-programs-launcher", "-stfullscreen", NULL};
static const char *slock[]         = {"slock", NULL};


///---Custom foo---///
static void halfandcentered(const Arg *arg)
{
	Arg arg2 = {.i=TWOBWM_MAXHALF_VERTICAL_LEFT};
	maxhalf(&arg2);
	Arg arg3 = {.i=TWOBWM_TELEPORT_CENTER};
	teleport(&arg3);
}

// #define WORKSPACES 6


///---Shortcuts---///
/* Check /usr/include/X11/keysymdef.h for the list of all keys
 * 0x000000 is for no modkey.
 * If you are having trouble finding the right keycode use the `xev` to get it
 * For example:
 * KeyRelease event, serial 40, synthetic NO, window 0x1e00001,
 *  root 0x98, subw 0x0, time 211120530, (128,73), root:(855,214),
 *  state 0x10, keycode 171 (keysym 0x1008ff17, XF86AudioNext), same_screen YES,
 *  XLookupString gives 0 bytes: 
 *  XFilterEvent returns: False
 *
 *  The keycode here is keysym 0x1008ff17, so use  0x1008ff17
 *
 *
 * For AZERTY keyboards XK_1...0 should be replaced by :
 *      DESKTOPCHANGE(     XK_ampersand,                     0)
 *      DESKTOPCHANGE(     XK_eacute,                        1)
 *      DESKTOPCHANGE(     XK_quotedbl,                      2)
 *      DESKTOPCHANGE(     XK_apostrophe,                    3)
 *      DESKTOPCHANGE(     XK_parenleft,                     4)
 *      DESKTOPCHANGE(     XK_minus,                         5)
 *      DESKTOPCHANGE(     XK_egrave,                        6)
 *      DESKTOPCHANGE(     XK_underscore,                    7)
 *      DESKTOPCHANGE(     XK_ccedilla,                      8)
 *      DESKTOPCHANGE(     XK_agrave,                        9)*
 */
#define DESKTOPCHANGE(K,N) \
{  MOD,              K,              changeworkspace, {.i=N}}, \
{  MOD |SHIFT,       K,              sendtoworkspace, {.i=N}},
static key keys[] = {
    /* modifier           key            function           argument */
    // Focus to next/previous window:
    {  MOD,               XK_Tab,        focusnext,         {.i=TWOBWM_FOCUS_NEXT}},
    {  MOD |SHIFT,        XK_Tab,        focusnext,         {.i=TWOBWM_FOCUS_PREVIOUS}},
    // Kill a window:
    {  MOD,               XK_q,          deletewin,         {}},
    // Resize a window:
    {  MOD |SHIFT,        XK_k,          resizestep,        {.i=TWOBWM_RESIZE_UP}},
    {  MOD |SHIFT,        XK_j,          resizestep,        {.i=TWOBWM_RESIZE_DOWN}},
    {  MOD |SHIFT,        XK_l,          resizestep,        {.i=TWOBWM_RESIZE_RIGHT}},
    {  MOD |SHIFT,        XK_h,          resizestep,        {.i=TWOBWM_RESIZE_LEFT}},
    // Resize a window slower:
    {  MOD |SHIFT|CONTROL,XK_k,          resizestep,        {.i=TWOBWM_RESIZE_UP_SLOW}},
    {  MOD |SHIFT|CONTROL,XK_j,          resizestep,        {.i=TWOBWM_RESIZE_DOWN_SLOW}},
    {  MOD |SHIFT|CONTROL,XK_l,          resizestep,        {.i=TWOBWM_RESIZE_RIGHT_SLOW}},
    {  MOD |SHIFT|CONTROL,XK_h,          resizestep,        {.i=TWOBWM_RESIZE_LEFT_SLOW}},
    // Move a window:
    {  MOD,               XK_k,          movestep,          {.i=TWOBWM_MOVE_UP}},
    {  MOD,               XK_j,          movestep,          {.i=TWOBWM_MOVE_DOWN}},
    {  MOD,               XK_l,          movestep,          {.i=TWOBWM_MOVE_RIGHT}},
    {  MOD,               XK_h,          movestep,          {.i=TWOBWM_MOVE_LEFT}},
    // Move a window slower:
    {  MOD |CONTROL,      XK_k,          movestep,          {.i=TWOBWM_MOVE_UP_SLOW}},
    {  MOD |CONTROL,      XK_j,          movestep,          {.i=TWOBWM_MOVE_DOWN_SLOW}},
    {  MOD |CONTROL,      XK_l,          movestep,          {.i=TWOBWM_MOVE_RIGHT_SLOW}},
    {  MOD |CONTROL,      XK_h,          movestep,          {.i=TWOBWM_MOVE_LEFT_SLOW}},
    // Teleport the window to an area of the screen:
    // Center:
    {  MOD,               XK_g,          teleport,           {.i=TWOBWM_TELEPORT_CENTER}},
    // Center y:
    {  MOD |SHIFT,        XK_g,          teleport,           {.i=TWOBWM_TELEPORT_CENTER_Y}},
    // Center x:
    {  MOD |CONTROL,      XK_g,          teleport,           {.i=TWOBWM_TELEPORT_CENTER_X}},
    // Top left:
    {  MOD,               XK_y,          teleport,           {.i=TWOBWM_TELEPORT_TOP_LEFT}},
    // Top right:
    {  MOD,               XK_u,          teleport,           {.i=TWOBWM_TELEPORT_TOP_RIGHT}},
    // Bottom left:
    {  MOD,               XK_b,          teleport,           {.i=TWOBWM_TELEPORT_BOTTOM_LEFT}},
    // Bottom right:
    {  MOD,               XK_n,          teleport,           {.i=TWOBWM_TELEPORT_BOTTOM_RIGHT}},
    // Resize while keeping the window aspect:
    {  MOD,               XK_Home,       resizestep_aspect,  {.i=TWOBWM_RESIZE_KEEP_ASPECT_GROW}},
    {  MOD,               XK_End,        resizestep_aspect,  {.i=TWOBWM_RESIZE_KEEP_ASPECT_SHRINK}},
    // Full screen window without borders:
    {  MOD,               XK_x,          maximize,            {.i=TWOBWM_FULLSCREEN}},
    // Full screen window without borders overiding offsets:
    {  MOD |SHIFT,        XK_x,          maximize,           {.i=TWOBWM_FULLSCREEN_OVERRIDE_OFFSETS}},
    // Maximize vertically:
    {  MOD,               XK_m,          maxvert_hor,        {.i=TWOBWM_MAXIMIZE_VERTICALLY}},
    // Maximize horizontally:
    {  MOD |SHIFT,        XK_m,          maxvert_hor,        {.i=TWOBWM_MAXIMIZE_HORIZONTALLY}},
    // Maximize and move:
    // Vertically left:
    {  MOD |SHIFT,        XK_y,          maxhalf,            {.i=TWOBWM_MAXHALF_VERTICAL_LEFT}},
    // Vertically right:
    {  MOD |SHIFT,        XK_u,          maxhalf,            {.i=TWOBWM_MAXHALF_VERTICAL_RIGHT}},
    // Horizontally left:
    {  MOD |SHIFT,        XK_b,          maxhalf,            {.i=TWOBWM_MAXHALF_HORIZONTAL_BOTTOM}},
    // Horizontally right:
    {  MOD |SHIFT,        XK_n,          maxhalf,            {.i=TWOBWM_MAXHALF_HORIZONTAL_TOP}},
    // Fold half vertically:
    {  MOD |SHIFT|CONTROL,XK_y,          maxhalf,            {.i=TWOBWM_MAXHALF_FOLD_VERTICAL}},
    // Fold half horizontally:
    {  MOD |SHIFT|CONTROL,XK_b,          maxhalf,            {.i=TWOBWM_MAXHALF_FOLD_HORIZONTAL}},
    // Unfold vertically:
    {  MOD |SHIFT|CONTROL,XK_u,          maxhalf,            {.i=TWOBWM_MAXHALF_UNFOLD_VERTICAL}},
    // Unfold horizontally:
    {  MOD |SHIFT|CONTROL,XK_n,          maxhalf,            {.i=TWOBWM_MAXHALF_UNFOLD_HORIZONTAL}},
    // Next/Previous screen:
    {  MOD,               XK_comma,      changescreen,       {.i=TWOBWM_NEXT_SCREEN}},
    {  MOD,               XK_period,     changescreen,       {.i=TWOBWM_PREVIOUS_SCREEN}},
    // Raise or lower a window:
    {  MOD,               XK_r,          raiseorlower,       {}},
    // Next/Previous workspace:
    {  MOD,               XK_v,          nextworkspace,      {}},
    {  MOD,               XK_c,          prevworkspace,      {}},
    // Move to Next/Previous workspace:
    {  MOD |SHIFT,        XK_v,          sendtonextworkspace,{}},
    {  MOD |SHIFT,        XK_c,          sendtoprevworkspace,{}},
    // Iconify the window:
    //{  MOD,              XK_i,          hide,               {}},
    // Make the window unkillable:
    {  MOD,               XK_a,          unkillable,         {}},
    // Make the window appear always on top:
    {  MOD,               XK_t,          always_on_top,      {}},
    // Make the window stay on all workspaces:
    {  MOD,               XK_f,          fix,                {}},
    // Move the cursor:
    {  MOD,               XK_Up,         cursor_move,        {.i=TWOBWM_CURSOR_UP_SLOW}},
    {  MOD,               XK_Down,       cursor_move,        {.i=TWOBWM_CURSOR_DOWN_SLOW}},
    {  MOD ,              XK_Right,      cursor_move,        {.i=TWOBWM_CURSOR_RIGHT_SLOW}},
    {  MOD,               XK_Left,       cursor_move,        {.i=TWOBWM_CURSOR_LEFT_SLOW}},
    // Move the cursor faster:
    {  MOD |SHIFT,        XK_Up,         cursor_move,        {.i=TWOBWM_CURSOR_UP}},
    {  MOD |SHIFT,        XK_Down,       cursor_move,        {.i=TWOBWM_CURSOR_DOWN}},
    {  MOD |SHIFT,        XK_Right,      cursor_move,        {.i=TWOBWM_CURSOR_RIGHT}},
    {  MOD |SHIFT,        XK_Left,       cursor_move,        {.i=TWOBWM_CURSOR_LEFT}},
    // Start programs:
    {  MOD,               XK_p,          start,              {.com = screenshot}},
    {  MOD,               XK_w,          start,              {.com = rec}},
    {  MOD |SHIFT,        XK_w,          start,              {.com = norec}},
    {  MOD,               XK_d,          start,              {.com = rofir}},
    {  MOD |SHIFT,        XK_d,          start,              {.com = rofiw}},
    {  MOD,               XK_i,          start,              {.com = astd}},
    {  MOD |SHIFT,        XK_i,          start,              {.com = astl}},
    {  MOD,               XK_o,          start,              {.com = cstd}},
    {  MOD |SHIFT,        XK_o,          start,              {.com = cstl}},
    {  MOD,               XK_z,          start,              {.com = draw}},
    {  MOD,               XK_Return,     start,              {.com = st}},
    {  MOD |SHIFT,        XK_Return,     start,              {.com = stfullscreen}},
    {  MOD,               XK_s,          start,              {.com = slock}},
    // Exit or restart 2bwm:
    {  MOD |CONTROL,      XK_q,          twobwm_exit,        {.i=0}},
    {  MOD |CONTROL,      XK_r,          twobwm_restart,     {.i=0}},
    {  MOD,               XK_space,      halfandcentered,    {.i=0}},
    // Change current workspace:
       DESKTOPCHANGE(     XK_1,                              0)
       DESKTOPCHANGE(     XK_2,                              1)
       DESKTOPCHANGE(     XK_3,                              2)
       DESKTOPCHANGE(     XK_4,                              3)
       DESKTOPCHANGE(     XK_5,                              4)
       DESKTOPCHANGE(     XK_6,                              5)
       DESKTOPCHANGE(     XK_7,                              6)
       DESKTOPCHANGE(     XK_8,                              7)
       DESKTOPCHANGE(     XK_9,                              8)
       DESKTOPCHANGE(     XK_0,                              9)
};

// The last argument makes it a root window only event
static Button buttons[] = {
    {  MOD,        XCB_BUTTON_INDEX_1,   mousemotion,        {.i=TWOBWM_MOVE},   false},
    {  MOD,        XCB_BUTTON_INDEX_3,   mousemotion,        {.i=TWOBWM_RESIZE}, false},
    {  0,          XCB_BUTTON_INDEX_3,   start,              {.com = menucmd},   true},
    {  MOD|SHIFT,  XCB_BUTTON_INDEX_1,   changeworkspace,    {.i=0},             false},
    {  MOD|SHIFT,  XCB_BUTTON_INDEX_3,   changeworkspace,    {.i=1},             false},
    {  MOD|ALT,    XCB_BUTTON_INDEX_1,   changescreen,       {.i=1},             false},
    {  MOD|ALT,    XCB_BUTTON_INDEX_3,   changescreen,       {.i=0},             false}
};
