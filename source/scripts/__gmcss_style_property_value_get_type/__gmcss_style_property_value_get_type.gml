/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc    Returns the type of a given style property value.
/// @param   _value	{Any}	The style property value to evaluate.
/// @returns		{Real}	A GMCSS_STYLE_PROPERTY_VALUE_TYPES value that represents the value's type.
function __gmcss_style_property_value_get_type(_value) {

	// Type is a number
	if(typeof(_value) == "number") {
		return GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER;	
	}
	
	// Type is a string - evaluate further
	if(typeof(_value) == "string") {
		
		// Type is a percent
		if(string_pos(GMCSS_VALUE_PROPERTY_PERCENT, _value) != 0) {
			return GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT;	
		}
		
		// Type is a percent
		if(string_pos(GMCSS_VALUE_PROPERTY_AUTO, _value) != 0) {
			return GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO;
		}
		
		return GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRING;
		
	}
	
	// Type is a struct
	if(typeof(_value) == "struct") {
		return GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT;	
	}
	
	// Type is sprite
	try {
		if(asset_get_type(sprite_get_name(_value)) == asset_sprite) {
			
			return GMCSS_STYLE_PROPERTY_VALUE_TYPES.SPRITE;	
		}
	} catch(e) {
		// Type is unknown
		return GMCSS_STYLE_PROPERTY_VALUE_TYPES.UNKNOWN;
	}

	// Type is unknown
	return GMCSS_STYLE_PROPERTY_VALUE_TYPES.UNKNOWN;
	
}