/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/*
	All style properties for gmcss style structs.
*/
enum GMCSS_STYLE_PROPERTIES {
	PADDING,
	PADDING_TOP,
	PADDING_BOTTOM,
	PADDING_LEFT,
	PADDING_RIGHT,
	MARGIN,
	MARGIN_TOP,
	MARGIN_BOTTOM,
	MARGIN_LEFT,
	MARGIN_RIGHT,
	SIZE,
	WIDTH,
	HEIGHT,
	BACKGROUND,
	BACKGROUND_COLOR,
	BACKGROUND_IMAGE,
	TEXT_COLOR,
	ALPHA,
	BG_ALPHA,
	TEXT_ALPHA,
	FONT_FAMILY,
	LINE_HEIGHT,
	BORDER,
	BORDER_TOP,
	BORDER_BOTTOM,
	BORDER_LEFT,
	BORDER_RIGHT,
	BORDER_WIDTH,
	BORDER_WIDTH_TOP,
	BORDER_WIDTH_BOTTOM,
	BORDER_WIDTH_LEFT,
	BORDER_WIDTH_RIGHT,
	BORDER_COLOR,
	BORDER_ALPHA,
	SCALE,
	SCALE_X,
	SCALE_Y,
	ORIGIN,
	ORIGIN_X,
	ORIGIN_Y,
	OFFSET,
	OFFSET_X,
	OFFSET_Y,
	CURSOR,
	__COUNT,
} 

/*
	Events that gmcss elements can be drawn with.
*/
enum GMCSS_ELEMENT_DRAW_EVENTS {
	DRAW_BEGIN,
	DRAW,
	DRAW_END,
	DRAW_GUI_BEGIN,
	DRAW_GUI,
	DRAW_GUI_END,
	PRE_DRAW,
	POST_DRAW,
}

/*
	Possible property value types within gmcss.
*/
enum GMCSS_STYLE_PROPERTY_VALUE_TYPES {
	NUMBER,
	PERCENT,
	AUTO,
	STRUCT,
	SPRITE,
	ANY,
	UNKNOWN,
}

/*
	Possible element hover states within gmcss.
*/
enum GMCSS_ELEMENT_HOVER_STATES {
	NOT_HOVERED,
	HOVERED,
}

/*
	Possible element events.
*/
enum GMCSS_ELEMENT_EVENTS {
	MOUSE_ENTER,
	MOUSE_LEAVE,
	MOUSE_CLICK,
	MOUSE_RIGHT_CLICK,
}

/*
	Possible transition timing functions.
*/
enum GMCSS_STYLE_TIMING_FUNCTIONS {
	LINEAR,
	EASE,
	CUBIC,
	QUART,
	EXPO,
	CIRC,
	BACK,
	ELASTIC,
	BOUNCE,
	FAST_TO_SLOW,
	MID_SLOW,
}

/*
	Possible background types.
*/
enum GMCSS_STYLE_BACKGROUNDS {
	COLOR,
	IMAGE,
	NONE,
}