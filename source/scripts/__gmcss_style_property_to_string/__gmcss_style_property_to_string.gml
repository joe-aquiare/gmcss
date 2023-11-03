/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

function __gmcss_style_property_to_string(_property) {
	
	switch(_property) {
		
		case GMCSS_STYLE_PROPERTIES.PADDING:				return "padding";
		case GMCSS_STYLE_PROPERTIES.PADDING_TOP:			return "padding_top";
		case GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM:			return "padding_bottom";
		case GMCSS_STYLE_PROPERTIES.PADDING_LEFT:			return "padding_left";
		case GMCSS_STYLE_PROPERTIES.PADDING_RIGHT:			return "padding_right";
		case GMCSS_STYLE_PROPERTIES.MARGIN:					return "margin";
		case GMCSS_STYLE_PROPERTIES.MARGIN_TOP:				return "margin_top";
		case GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM:			return "margin_bottom";
		case GMCSS_STYLE_PROPERTIES.MARGIN_LEFT:			return "margin_left";
		case GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT:			return "margin_right";
		case GMCSS_STYLE_PROPERTIES.SIZE:					return "size";
		case GMCSS_STYLE_PROPERTIES.WIDTH:					return "width";
		case GMCSS_STYLE_PROPERTIES.HEIGHT:					return "height";
		case GMCSS_STYLE_PROPERTIES.BG_COLOR:				return "bg_color";
		case GMCSS_STYLE_PROPERTIES.TEXT_COLOR:				return "text_color";
		case GMCSS_STYLE_PROPERTIES.ALPHA:					return "alpha";
		case GMCSS_STYLE_PROPERTIES.BG_ALPHA:				return "bg_alpha";
		case GMCSS_STYLE_PROPERTIES.TEXT_ALPHA:				return "text_alpha";
		case GMCSS_STYLE_PROPERTIES.FONT_FAMILY:			return "font_family";
		case GMCSS_STYLE_PROPERTIES.LINE_HEIGHT:			return "line_height";
		case GMCSS_STYLE_PROPERTIES.BORDER:					return "border";
		case GMCSS_STYLE_PROPERTIES.BORDER_TOP:				return "border_top";
		case GMCSS_STYLE_PROPERTIES.BORDER_BOTTOM:			return "border_bottom";
		case GMCSS_STYLE_PROPERTIES.BORDER_LEFT:			return "border_left";
		case GMCSS_STYLE_PROPERTIES.BORDER_RIGHT:			return "border_right";
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH:			return "border_width";
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP:		return "border_width_top";
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM:	return "border_width_bottom";
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT:		return "border_width_left";
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT:		return "border_width_right";
		case GMCSS_STYLE_PROPERTIES.BORDER_COLOR:			return "border_color";
		case GMCSS_STYLE_PROPERTIES.SCALE:					return "scale";
		case GMCSS_STYLE_PROPERTIES.SCALE_X:				return "scale_x";
		case GMCSS_STYLE_PROPERTIES.SCALE_Y:				return "scale_y";
		case GMCSS_STYLE_PROPERTIES.ORIGIN:					return "origin";
		case GMCSS_STYLE_PROPERTIES.ORIGIN_X:				return "origin_x";
		case GMCSS_STYLE_PROPERTIES.ORIGIN_Y:				return "origin_y";
		case GMCSS_STYLE_PROPERTIES.CURSOR:					return "cursor";

	}
	
	return "";
	
}