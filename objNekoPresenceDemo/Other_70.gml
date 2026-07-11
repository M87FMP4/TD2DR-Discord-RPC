/// @description Discord Event
var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
    global.discord_initialized = true;
    ready = true;
    
    np_setpresence_timestamps(date_current_datetime(), 0, false);
    np_setpresence_buttons(0, "Download The Game", "https://gamejolt.com/games/disaster2dr/780541");
}
