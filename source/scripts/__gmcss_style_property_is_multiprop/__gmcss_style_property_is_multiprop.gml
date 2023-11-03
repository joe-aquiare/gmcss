
function __gmcss_style_property_is_multiprop(_property, _multiprop) {
	
	var is_multiprop = false;
	
	switch(_multiprop) {
		
		case GMCSS_STYLE_PROPERTIES.PADDING:
		
			if(
				_property == GMCSS_STYLE_PROPERTIES.PADDING_TOP		||
				_property == GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM	||
				_property == GMCSS_STYLE_PROPERTIES.PADDING_LEFT	||
				_property == GMCSS_STYLE_PROPERTIES.PADDING_RIGHT
			) {
				is_multiprop = true;	
			}
		
		break;
		
		case GMCSS_STYLE_PROPERTIES.MARGIN:
		
			if(
				_property == GMCSS_STYLE_PROPERTIES.MARGIN_TOP		||
				_property == GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM	||
				_property == GMCSS_STYLE_PROPERTIES.MARGIN_LEFT		||
				_property == GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT
			) {
				is_multiprop = true;	
			}
		
		break;
		
		case GMCSS_STYLE_PROPERTIES.BORDER:
		
			if(
				_property == GMCSS_STYLE_PROPERTIES.BORDER_TOP		||
				_property == GMCSS_STYLE_PROPERTIES.BORDER_BOTTOM	||
				_property == GMCSS_STYLE_PROPERTIES.BORDER_LEFT		||
				_property == GMCSS_STYLE_PROPERTIES.BORDER_RIGHT
			) {
				is_multiprop = true;	
			}
		
		break;
		
		case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH:
		
			if(
				_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP		||
				_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM		||
				_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT		||
				_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT
			) {
				is_multiprop = true;	
			}
		
		break;
		
		case GMCSS_STYLE_PROPERTIES.SIZE:
		
			if(
				_property == GMCSS_STYLE_PROPERTIES.WIDTH ||
				_property == GMCSS_STYLE_PROPERTIES.HEIGHT
			) {
				is_multiprop = true;	
			}
		
		break;
		
		case GMCSS_STYLE_PROPERTIES.SCALE:
		
			if(
				_property == GMCSS_STYLE_PROPERTIES.SCALE_X ||
				_property == GMCSS_STYLE_PROPERTIES.SCALE_Y
			) {
				is_multiprop = true;	
			}
		
		break;
		
		case GMCSS_STYLE_PROPERTIES.ORIGIN:
		
			if(
				_property == GMCSS_STYLE_PROPERTIES.ORIGIN_X ||
				_property == GMCSS_STYLE_PROPERTIES.ORIGIN_Y
			) {
				is_multiprop = true;	
			}
		
		break;
		
	}
	
	return is_multiprop;
	
}