/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

function __gmcss_style_property_get_allowed_value_types(_property) {
	
	var allowed_types = [];
	
	switch(_property) {
		
		case GMCSS_STYLE_PROPERTIES.PADDING:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.PADDING_TOP:	
		case GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM: 
		case GMCSS_STYLE_PROPERTIES.PADDING_LEFT:	
		case GMCSS_STYLE_PROPERTIES.PADDING_RIGHT:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.MARGIN:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.MARGIN_TOP:		
		case GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM:	
		case GMCSS_STYLE_PROPERTIES.MARGIN_LEFT:	
		case GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.WIDTH:			
		case GMCSS_STYLE_PROPERTIES.HEIGHT:			
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER, 
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.BACKGROUND:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.BACKGROUND_IMAGE:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.TEXT_COLOR:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.ALPHA:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.BG_ALPHA:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.TEXT_ALPHA:		
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.FONT_FAMILY:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
			
		case GMCSS_STYLE_PROPERTIES.LINE_HEIGHT:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.BORDER:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT,
			];
		break;

		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP:
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM:
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT:
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.BORDER_COLOR:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.BORDER_ALPHA:	
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.SCALE:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.SCALE_X:
		case GMCSS_STYLE_PROPERTIES.SCALE_Y:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.CURSOR:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.OFFSET:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER,
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT,
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.OFFSET_X:
		case GMCSS_STYLE_PROPERTIES.OFFSET_Y:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER
			];
		break;
		
		case GMCSS_STYLE_PROPERTIES.DISPLAY:
		case GMCSS_STYLE_PROPERTIES.POSITION:
			allowed_types = [
				GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRING
			];
		break;
			
	}
	
	return allowed_types;

}