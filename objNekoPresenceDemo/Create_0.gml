/// @description Initialize Discord

#macro DISCORD_APP_ID "1518957649729687664" // change later to your discord application id!

ready = false;
global.discord_initialized = false;
global.current_room = "";

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}

alarm[0] = room_speed * 5;
