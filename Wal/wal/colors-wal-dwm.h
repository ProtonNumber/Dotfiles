static const char norm_fg[] = "#dbd8da";
static const char norm_bg[] = "#1c1f26";
static const char norm_border[] = "#2d323d";

static const char sel_fg[] = "#dbd8da";
static const char sel_bg[] = "#a2e374";
static const char sel_border[] = "#dbd8da";

static const char urg_fg[] = "#dbd8da";
static const char urg_bg[] = "#e37e74";
static const char urg_border[] = "#e37e74";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
