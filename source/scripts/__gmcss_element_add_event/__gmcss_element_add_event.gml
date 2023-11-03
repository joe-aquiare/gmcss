/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

function __gmcss_element_add_event(_event_type, _event, _element = self) {

	with(_element) {
		switch(_event_type) {
			case GMCSS_ELEMENT_EVENTS.MOUSE_ENTER:			ds_list_add(mouse_events.enter,			_event); break;
			case GMCSS_ELEMENT_EVENTS.MOUSE_LEAVE:			ds_list_add(mouse_events.leave,			_event); break;
			case GMCSS_ELEMENT_EVENTS.MOUSE_CLICK:			ds_list_add(mouse_events.click,			_event); break;
			case GMCSS_ELEMENT_EVENTS.MOUSE_RIGHT_CLICK:	ds_list_add(mouse_events.right_click,	_event); break;
		}
	}

}