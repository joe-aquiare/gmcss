/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

function gmcss_element_get_bounds(_element = self) {
	
	var offset = _element.style.get_property(GMCSS_STYLE_PROPERTIES.OFFSET);
	
	return {
		x1: _element.x + _element.parent_offset.x + offset.x,
		y1: _element.y + _element.parent_offset.y + offset.y,
		x2: _element.x + _element.parent_offset.x + offset.x + _element.get_width_in_pixels(),
		y2: _element.y + _element.parent_offset.y + offset.y + _element.get_height_in_pixels(), 
	};
	
}