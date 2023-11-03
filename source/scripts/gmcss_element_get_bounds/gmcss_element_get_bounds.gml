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
	return {
		x1: _element.x + _element.origin.x + _element.offset.x,
		y1: _element.y + _element.origin.y + _element.offset.y,
		x2: _element.x + _element.origin.x + _element.offset.x + _element.get_width_in_pixels(),
		y2: _element.y + _element.origin.y + _element.offset.y + _element.get_height_in_pixels(), 
	};
}