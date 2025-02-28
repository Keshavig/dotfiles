static const char *colorname[] = {
	"#1a1b26", /* hard contrast: #16161e / soft contrast: #24283b */
	"#f7768e", /* red */
	"#9ece6a", /* green */
	"#e0af68", /* yellow */
	"#7aa2f7", /* blue */
	"#bb9af7", /* purple */
	"#73daca", /* cyan */
	"#c0caf5", /* white */
	"#565f89", /* bright black */
	"#f7768e", /* bright red */
	"#9ece6a", /* bright green */
	"#e0af68", /* bright yellow */
	"#7aa2f7", /* bright blue */
	"#bb9af7", /* bright purple */
	"#73daca", /* bright cyan */
	"#a9b1d6", /* bright white */
	[255] = 0,
	/* more colors can be added after 255 to use with DefaultXX */
	"#c0caf5", /* 256 -> cursor */
	"#565f89", /* 257 -> rev cursor*/
	"#1a1b26", /* 258 -> bg */
	"#c0caf5", /* 259 -> fg */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 259;
unsigned int defaultbg = 258;
unsigned int defaultcs = 256;
static unsigned int defaultrcs = 257;
