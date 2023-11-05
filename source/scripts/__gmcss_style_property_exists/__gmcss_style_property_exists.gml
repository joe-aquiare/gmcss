function __gmcss_style_property_exists(_property) {

	return real(_property) < GMCSS_STYLE_PROPERTIES.__COUNT;

}

function __gmcss_style_property_name_exists(_property_name) {

	for(var property_index = 0; property_index < GMCSS_STYLE_PROPERTIES.__COUNT; property_index++) {
		
		if(__gmcss_style_property_to_string(property_index) == _property_name) {
			show_debug_message(_property_name + "->" + __gmcss_style_property_to_string(property_index))
			return true;
			
		}
		
	}
	
	return false;

}