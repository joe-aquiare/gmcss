timer += __GMCSS_DELTA_TIME * global.gmcss_ball_orbit_speed * .01;

global.gmcss_ball_x = room_width / 2;
global.gmcss_ball_y = room_height / 2;

global.gmcss_ball_x += global.gmcss_ball_orbit_radius * sin(timer);
global.gmcss_ball_y += global.gmcss_ball_orbit_radius * cos(timer);