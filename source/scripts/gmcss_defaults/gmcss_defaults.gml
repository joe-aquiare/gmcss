/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

#region Style values

/*
	Default padding for every new gmcss style struct.
	Default: { top: 5, bottom: 5, left: 5, right: 5 }
*/
#macro GMCSS_DEFAULT_STYLE_PADDING { top: 5, bottom: 5, left: 5, right: 5 }

/*
	Default margin for every new gmcss style struct.
	Default: { top: 0, bottom: 5, left: 0, right: 5 }
*/
#macro GMCSS_DEFAULT_STYLE_MARGIN { top: 0, bottom: 5, left: 0, right: 5 }

/*
	Default width for every new gmcss style struct.
	Default: GMCSS_VALUE_PROPERTY_AUTO
*/
#macro GMCSS_DEFAULT_STYLE_WIDTH GMCSS_VALUE_PROPERTY_AUTO

/*
	Default height for every new gmcss style struct.
	Default: GMCSS_VALUE_PROPERTY_AUTO
*/
#macro GMCSS_DEFAULT_STYLE_HEIGHT GMCSS_VALUE_PROPERTY_AUTO

/*

	Default: GMCSS_STYLE_BACKGROUNDS.NONE
*/
#macro GMCSS_DEFAULT_STYLE_BACKGROUND GMCSS_STYLE_BACKGROUNDS.NONE

/*
	Default background color for every new gmcss style struct.
	Default: c_white
*/
#macro GMCSS_DEFAULT_STYLE_BACKGROUND_COLOR c_white

/*

	Default: undefined
*/
#macro GMCSS_DEFAULT_STYLE_BACKGROUND_IMAGE undefined

/*
	Default text color for every new gmcss style struct.
	Default: c_black
*/
#macro GMCSS_DEFAULT_STYLE_TEXT_COLOR c_black

/*
	Default alpha for every new gmcss style struct.
	Default: 1
*/
#macro GMCSS_DEFAULT_STYLE_ALPHA 1

/*
	Default background alpha for every new gmcss style struct.
	Default: 1
*/
#macro GMCSS_DEFAULT_STYLE_BACKGROUND_ALPHA 1

/*
	Default text alpha for every new gmcss style struct.
	Default: 1
*/
#macro GMCSS_DEFAULT_STYLE_TEXT_ALPHA 1

/*
	Default text font family for every new gmcss style struct.
	Default: __fnt_gmcss_default
*/
#macro GMCSS_DEFAULT_STYLE_FONT_FAMILY __fnt_gmcss_default

/*
	Default text line height for every new gmcss style struct.
	Default: 5
*/
#macro GMCSS_DEFAULT_STYLE_LINE_HEIGHT 5

/*
	
	Default: false
*/
#macro GMCSS_DEFAULT_STYLE_BORDER false

/*
	
	Default: 0
*/
#macro GMCSS_DEFAULT_STYLE_BORDER_WIDTH 0

/*
	
	Default: c_black
*/
#macro GMCSS_DEFAULT_STYLE_BORDER_COLOR c_black

/*
	
	Default: 1
*/
#macro GMCSS_DEFAULT_STYLE_BORDER_ALPHA 1

/*
	
	Default: 1
*/
#macro GMCSS_DEFAULT_STYLE_SCALE 1

/*
	
	Default: .5
*/
#macro GMCSS_DEFAULT_STYLE_ORIGIN .5

/*
	
	Default: 0
*/
#macro GMCSS_DEFAULT_STYLE_OFFSET 0

/*
	
	Default: cr_default
*/
#macro GMCSS_DEFAULT_STYLE_CURSOR cr_default

/*
	
	Default: cr_default
*/
#macro GMCSS_DEFAULT_STYLE_DISPLAY GMCSS_VALUE_PROPERTY_INLINE

/*
	
	Default: cr_default
*/
#macro GMCSS_DEFAULT_STYLE_POSITION GMCSS_VALUE_PROPERTY_STATIC

#endregion

#region Element values

/* 
	Default draw event for every new gmcss element.
	Default: GMCSS_ELEMENT_DRAW_EVENTS.DRAW_GUI
*/
#macro GMCSS_DEFAULT_ELEMENT_DRAW_EVENT GMCSS_ELEMENT_DRAW_EVENTS.DRAW_GUI

/*
	Default for depth assertion for child elements.
	Note: Turning this off will mean you must manage child element depths manually. This is not encouraged unless there is a good reason for doing so.
	Default: true
*/
#macro GMCSS_DEFAULT_ELEMENT_ASSERT_CHILD_DEPTH true

#endregion

#region Rules

/*
	Whether negative padding on a gmcss element is allowed by default.
*/
#macro GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_PADDING true

/*
	Whether negative margin on a gmcss element is allowed by default.
*/
#macro GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_MARGIN true

/*
	Whether negative width or height values are allowed by default.
*/
#macro GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_SIZE false

/*
	Whether negative line height values are allowed by default.
*/
#macro GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_LINE_HEIGHT true

/*
	Whether negative scale values are allowed by default.
*/
#macro GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_SCALE true

/*
	Whether alpha values are clamped between 0.0 and 1.0 by default.
*/
#macro GMCSS_DEFAULT_RULES_CLAMP_ALPHA false

#endregion