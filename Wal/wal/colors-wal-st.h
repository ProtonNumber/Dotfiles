const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1c1f26", /* black   */
  [1] = "#e37e74", /* red     */
  [2] = "#a2e374", /* green   */
  [3] = "#325491", /* yellow  */
  [4] = "#74a2e3", /* blue    */
  [5] = "#99B0D9", /* magenta */
  [6] = "#90B4E7", /* cyan    */
  [7] = "#dbd8da", /* white   */

  /* 8 bright colors */
  [8]  = "#2d323d",  /* black   */
  [9]  = "#e37e74",  /* red     */
  [10] = "#a2e374", /* green   */
  [11] = "#325491", /* yellow  */
  [12] = "#74A2E3", /* blue    */
  [13] = "#99B0D9", /* magenta */
  [14] = "#90B4E7", /* cyan    */
  [15] = "#dbd8da", /* white   */

  /* special colors */
  [256] = "#1c1f26", /* background */
  [257] = "#dbd8da", /* foreground */
  [258] = "#dbd8da",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
