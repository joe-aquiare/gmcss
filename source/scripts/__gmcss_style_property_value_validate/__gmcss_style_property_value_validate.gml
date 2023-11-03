/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc  Validates a non-number value for a gmcss style property.
/// @param _value	{String}	The non-number value to validate.
/// @returns		{Bool}		Whether the non-number value is valid to use as a stype property.
function __gmcss_style_property_value_validate(_value) {
	
	if(typeof(_value) == "string") {
		
		// Trim value string
		_value = string_trim(_value);
		
		#region Percent 
		
		// Get position of percent sign in value
		var percent_pos = string_pos(GMCSS_VALUE_PROPERTY_PERCENT, _value);
		
		// If percent sign exists in string, validate that it is the last character
		if(percent_pos != 0) {
			if(percent_pos != string_length(_value)) {
				return false;
			}
		}
		
		#endregion
		
		#region Auto
		
		// Get position of auto string in value
		var auto_pos = string_pos(GMCSS_VALUE_PROPERTY_AUTO, _value);
		
		// Validate that auto exists in string and the string itself is not "auto" 
		if(auto_pos != 0) {
			if(string_lower(_value) != GMCSS_VALUE_PROPERTY_AUTO) {
				return false;
			}
		}
		
		#endregion
		
	}
	
	return true;

}