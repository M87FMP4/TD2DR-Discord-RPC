/// @description Initialize Discord

#macro DISCORD_APP_ID "1518957649729687664" // change later to your discord application id!

ready = false;
global.discord_initialized = false;
global.current_room = "";

if (!variable_global_exists("session_start_time"))
    global.session_start_time = date_current_datetime();

if (os_type == os_windows || os_type == os_macosx || os_type == os_linux)
{
    if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
	{
		show_debug_message("NekoPresence init fail"); 
	    ready = false;
	    global.discord_initialized = false;
	}
	else
	{
	    ready = true;
	    global.discord_initialized = true;
	}
}
