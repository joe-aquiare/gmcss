/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

function __gmcss_style_read_timing_function(_current_value, _transition) {
	
	// Get value from animation curve
	var curve_channel = animcurve_get_channel(_transition.timing_function, GMCSS_VALUE_TIMING_FUNCTION_CHANNEL);
	var curve_value = animcurve_channel_evaluate(curve_channel, clamp(_transition.timer, 0.0, 1.0));
	
	#region Color properties
	
	if(
		_transition.property == GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR		||
		_transition.property == GMCSS_STYLE_PROPERTIES.TEXT_COLOR	||
		_transition.property == GMCSS_STYLE_PROPERTIES.BORDER_COLOR
	) {
		return merge_color(_current_value, _transition.new_value, curve_value);
	}
	
	#endregion

	#region Number properties
	
	// Return new value
	return lerp(_current_value, _transition.new_value, curve_value);
	
	#endregion

}