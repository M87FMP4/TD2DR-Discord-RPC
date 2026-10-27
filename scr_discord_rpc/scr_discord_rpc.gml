function scr_discord_rpc()
{
    if (!global.discord_initialized) exit;
    
    var state_text = "";
    var details_text = "";
    var large_image = "td2dr-exe";
    var large_text = "";
    var small_image = "";
    var small_text = "";

    var in_minigame = false;
    if (instance_exists(obj_minigame))
    {
        if (obj_minigame.ingame) in_minigame = true;
    }

    if (in_minigame)
    {
        if (obj_minigame.boss)
        {
            state_text = "Boss Fight!";
            details_text = "Score: " + string(obj_minigame.cscore) + " | Best: " + string(obj_minigame.hiscore);
            large_image = "doomsdayzone";
            large_text = "Boss Fight";
            small_image = "";
            small_text = "";
        }
        else
        {
            state_text = "Playing Minigame";
            details_text = "Score: " + string(obj_minigame.cscore) + " | Best: " + string(obj_minigame.hiscore);
            large_image = "doomsdayzone";
            large_text = "Minigame";
            small_image = "";
            small_text = "";
        }
    }
    else
    {
        var current_room_name = room_get_name(room);
        var is_level = false;
        
        for (var i = 0; i < array_length(global.levels); i++)
        {
            if (room == global.levels[i].rid)
            {
                is_level = true;
                var level_name = global.levels[i].group;
                var level_image = "";
                
                switch(level_name)
                {
                    case "HideAndSeek2": level_name = "Hide and Seek Act 2"; level_image = "hs2"; break;
                    case "RavineMist": level_name = "Ravine Mist"; level_image = "rm"; break;
                    case "DotDotDot": level_name = "..."; level_image = "dot"; break;
                    case "DesertTown": level_name = "Desert Town"; level_image = "desert"; break;
                    case "YouCantRun": level_name = "You Can't Run"; level_image = "ycr"; break;
                    case "LimpCity": level_name = "Limp City"; level_image = "limpcity"; break;
                    case "NotPerfect": level_name = "Not Perfect"; level_image = "np"; break;
                    case "KindaFair": level_name = "Kind and Fair"; level_image = "knf"; break;
                    case "Act9": level_name = "Act 9"; level_image = "act9"; break;
                    case "NastyParadise": level_name = "Nasty Paradise"; level_image = "nap"; break;
                    case "PricelessFreedom": level_name = "Priceless Freedom"; level_image = "pf"; break;
                    case "VolcanoValley": level_name = "Volcano Valley"; level_image = "vv"; break;
                    case "Hill": level_name = "Hill"; level_image = "ghz"; break;
                    case "MajinForest": level_name = "Majin Forest"; level_image = "majinforest"; break;
                    case "HideAndSeek": level_name = "Hide and Seek"; level_image = "hs"; break;
                    case "TortureCave": level_name = "Torture Cave"; level_image = "tc"; break;
                    case "DarkTower": level_name = "Dark Tower"; level_image = "dkt"; break;
                    case "HauntDream": level_name = "Haunting Dream"; level_image = "hd"; break;
                    case "WoodDream": level_name = "Mystic Wood"; level_image = "wd"; break;
                    case "Marijuna": level_name = "Echidna Ruins"; level_image = "mj"; break;
                    case "Fart": level_name = "Testing Place"; level_image = "fartzone"; break;
                }
                
                var is_exe = (global.character == CHARACTER_EXE);
                var character_image = "td2dr-exe";
                var character_name = "?";
                
                if (is_exe)
                {
                    switch(global.exeCharacter)
                    {
                        case EXE_ORIGINAL: character_image = "exe"; character_name = "Sonic.exe"; break;
                        case EXE_CHAOS: character_image = "napochaos"; character_name = "Chaos"; break;
                        case EXE_EXETIOR: character_image = "exetior"; character_name = "Exetior"; break;
                        case EXE_EXELLER: character_image = "exeller"; character_name = "Exeller"; break;
                        default: character_image = "hander"; character_name = "Hander"; break;
                    }
                }
                else
                {
                    switch(global.character)
                    {
                        case CHARACTER_TAILS: character_image = "tails"; character_name = "Tails"; break;
                        case CHARACTER_KNUX: character_image = "knux"; character_name = "Knuckles"; break;
                        case CHARACTER_EGGMAN: character_image = "egg"; character_name = "Eggman"; break;
                        case CHARACTER_AMY: character_image = "amy"; character_name = "Amy"; break;
                        case CHARACTER_CREAM: character_image = "cream"; character_name = "Cream"; break;
                        case CHARACTER_SALLY: character_image = "sally"; character_name = "Sally"; break;
                        default: character_image = "unknow"; character_name = "?"; break;
                    }
                }
           
                if (!is_exe && instance_exists(global.player) && global.character == CHARACTER_TAILS)
                {
                    var p_hp = global.player.hp;
                    var p_revivals = global.player.revivalTimes;
                    var has_red_ring = (global.player.redRingTimer > 0);
                    
                    if (p_revivals >= 2)
                    {
                        character_image = "tailsdemon";
                        small_text = "Playing As Demon Tails";
                    }
                    else if (p_hp <= 0)
                    {
                        character_image = (p_revivals == 0) ? "tailshp6" : "tailshp7";
                        small_text = "Playing As Tails (Dead)";
                    }
                    else 
                    {
                        if (p_hp >= 100) character_image = has_red_ring ? "tailsredring" : "tailshp"; 
                        else if (p_hp >= 75) character_image = has_red_ring ? "tailsredring2" : "tailshp2";  
                        else if (p_hp >= 50) character_image = has_red_ring ? "tailsredring3" : "tailshp3";  
                        else if (p_hp >= 25) character_image = has_red_ring ? "tailsredring4" : "tailshp4";  
                        else if (p_hp > 0)   character_image = has_red_ring ? "tailsredring5" : "tailshp5";
                        
                        if (p_revivals == 1)
                        {
                            small_text = "Playing As Tails (Last Life)";
                        }
                        else
                        {
                            small_text = "Playing As Tails";
                        }
                        
                        if (has_red_ring) small_text += " (Red Ring)";
                    }
                }
				
                var alive_players = 0;
                
                if (instance_exists(obj_netclient))
                {
                    with (obj_player_puppet)
                    {
                        if (character != CHARACTER_EXE && !isDemonized && hp > 0)
                            alive_players++;
                    }
                    
                    if (!is_exe && instance_exists(global.player) && global.player.revivalTimes < 2 && !global.player.isDead && global.player.hp > 0)
                        alive_players++;
                        
                    if (!is_exe && instance_exists(global.player) && !global.player.isDead && alive_players == 0)
                        alive_players = 1;
                        
                    if (is_exe)
                        alive_players += 1;
                }
                
                var players_string = string(alive_players) + " of 7";

                //Ravine Mist
                if (level_name == "Ravine Mist")
                {
                    var shards_count = 0;
                    if (instance_exists(obj_ravinemist_controller))
                        shards_count = obj_ravinemist_controller.shardCount;
                    
                    if (shards_count > 6) shards_count = 6;
                    if (shards_count < 0) shards_count = 0;
                    
                    details_text = "On Map: " + level_name + " (Shards: " + string(shards_count) + "/6)";
                }
                
                //DotDotDot
                else if (level_name == "..." && instance_exists(obj_dotdotdot_i))
                {
                    if (obj_dotdotdot_i.bgnew == background_dotdotdot2)
                    {
                        details_text = "On Map: " + level_name + " (Castle Eggman Floor 0)";
                        level_image = "dot2";
                    }
                    else if (obj_dotdotdot_i.bgnew == background_dotdotdot3)
                    {
                        details_text = "On Map: " + level_name + " (Castle Eggman Floor -1)";
                        level_image = "dot3";
                    }
                    else
                    {
                        details_text = "On Map: " + level_name + " (Castle Eggman Floor 1)";
                        level_image = "dot";
                    }
                }
                
                //Limp City
                else if (level_name == "Limp City")
                {
                    var using_eye = false;
                    if (instance_exists(obj_limpcity_eyeA))
                    {
                        with (obj_limpcity_eyeA)
                        {
                            if (used && useID == obj_netclient.nid)
                            {
                                using_eye = true;
                                break;
                            }
                        }
                    }
                    
                    if (using_eye)
                    {
                        details_text = "On Map: " + level_name + " (Using Eye)";
                        level_image = "lceye";
                    }
                    else
                    {
                        details_text = "On Map: " + level_name;
                    }
                }
                
                //Not Perfect
                else if (level_name == "Not Perfect" && instance_exists(obj_np_background))
                {
                    if (obj_np_background.bigrig)
                    {
                        level_image = "npchase";
                    }
                    details_text = "On Map: " + level_name;
                }
                
                //Volcano Valley
                else if (level_name == "Volcano Valley")
                {
                    var vases_left = 0;
                    if (instance_exists(obj_vv_vase))
                    {
                        with (obj_vv_vase)
                        {
                            if (visible)
                                vases_left++;
                        }
                    }
                    
                    var vases_broken = 14 - vases_left;
                    if (vases_broken < 0) vases_broken = 0;
                    if (vases_broken > 14) vases_broken = 14;
                    
                    details_text = "On Map: " + level_name + " (Vases: " + string(vases_broken) + "/14)";
                }
                
                //Torture Cave
                else if (level_name == "Torture Cave")
                {
                    if (instance_exists(obj_level) && obj_level.state == 1)
                    {
                        level_image = "tcooh";
                    }
                    details_text = "On Map: " + level_name;
                }
				
				//Mystic Wood (Weed Zone)
                else if (level_name == "Mystic Wood")
                {
                    var in_darkness = false;
                    
                    if (instance_exists(obj_weed))
                    {
                        if (obj_weed.weed_anim >= 0 || obj_weed.weed_progress > 0)
                        {
                            in_darkness = true;
                        }
                    }
                    
                    if (in_darkness)
                    {
                        level_image = "wdarms";
                        details_text = "On Map: " + level_name + " (In Darkness)";
                    }
                    else
                    {
                        details_text = "On Map: " + level_name;
                    }
                }
				
				//Echidna Ruins (Marijuna)
                else if (level_name == "Echidna Ruins")
                {
                    var crystal_effect = false;
                    
                    if (instance_exists(obj_marijuna_crystalcontroller))
                    {
                        if (obj_marijuna_crystalcontroller.size > 0)
                        {
                            crystal_effect = true;
                        }
                    }
                    
                    var is_chase = false;
                    if (instance_exists(obj_level) && obj_level.state == 1)
                    {
                        is_chase = true;
                    }
                    
                    if (crystal_effect)
                    {
                        level_image = "mjceffect";
                        details_text = "On Map: " + level_name + " (Crystal Effect)";
                    }
                    else if (is_chase)
                    {
                        level_image = "mjstatic";
                        details_text = "On Map: " + level_name;
                    }
                    else
                    {
                        details_text = "On Map: " + level_name;
                    }
                }
                else
                {
                    details_text = "On Map: " + level_name;
                }
                
                if (is_exe)
                    state_text = "Murdering (" + players_string + ")";
                else
                    state_text = "Surviving (" + players_string + ")";
                
                large_image = level_image;
                large_text = "Map: " + level_name;
                small_image = character_image;
				
                 if (small_text == "")
                    small_text = "Playing As " + character_name;
                break;
            }
        }
        
        if (!is_level)
        {
            if (instance_exists(obj_lobby) && obj_lobby.state == 1)
            {
                state_text = "Voting For Map";
                if (obj_lobby.mapChose)
                {
                    var chosen_map_id = -1;
                    switch(obj_lobby.mapChosen)
                    {
                        case 0: chosen_map_id = obj_lobby.map1; break;
                        case 1: chosen_map_id = obj_lobby.map2; break;
                        case 2: chosen_map_id = obj_lobby.map3; break;
                    }
                    var chosen_name = "?";
                    if (chosen_map_id >= 0 && chosen_map_id < array_length(global.levels))
                        chosen_name = global.levels[chosen_map_id].group;
						
						details_text = "Voted: " + chosen_name;
                }
                else details_text = "Choosing a map...";
                
                large_image = "mapvotes";
                large_text = "Map Voting";
                small_image = "";
                small_text = "";
            }
            else if (instance_exists(obj_lobby) && (obj_lobby.state == 2 || obj_lobby.state == 3))
            {
                state_text = "Character Select";
                var confirmed = false;
                var selected_idx = -1;
                var is_exe_player = (obj_netclient.exeId == obj_netclient.nid);
                var char_icon = "unknow";  
                var char_name = "?";       
                
                if (instance_exists(obj_lobby_icon))
                {
                    with (obj_lobby_icon)
                    {
                        if (master_id == obj_netclient.nid && isSelected)
                        {
                            confirmed = true;
                            selected_idx = selected;
                        }
                    }
                }
                
                if (confirmed)
                {
                    if (is_exe_player)
                    {
                        switch(selected_idx)
                        {
                            case 1: char_icon = "exe"; char_name = "Sonic.exe"; break;
                            case 2: char_icon = "napochaos"; char_name = "Chaos"; break;
                            case 3: char_icon = "exetior"; char_name = "Exetior"; break;
                            case 4: char_icon = "exeller"; char_name = "Exeller"; break;
                            default: char_icon = "unknow"; char_name = "?"; break;
                        }
                    }
                    else
                    {
                        switch(selected_idx)
                        {
                            case 1: char_icon = "tails"; char_name = "Tails"; break;
                            case 2: char_icon = "knux"; char_name = "Knuckles"; break;
                            case 3: char_icon = "egg"; char_name = "Eggman"; break;
                            case 4: char_icon = "amy"; char_name = "Amy"; break;
                            case 5: char_icon = "cream"; char_name = "Cream"; break;
                            case 6: char_icon = "sally"; char_name = "Sally"; break;
                            default: char_icon = "unknow"; char_name = "?"; break;
                        }
                    }
                }
                details_text = "Selected: " + char_name;
                small_image = char_icon;
                small_text = char_name;
                large_image = "charselect";
                large_text = "Character Select";
            }
            else
            {
                switch(room)
                {
                    case room_waiting:
                        state_text = "Waiting For Round To End...";
                        details_text = "";
                        large_image = "waiting";
                        large_text = "Waiting";
                        small_image = "";
                        small_text = "";
                        break;
                    case room_results:
                        state_text = "End Of Round";
                        details_text = "";
                        large_image = "results";
                        large_text = "Results";
                        small_image = "";
                        small_text = "";
                        
                        if (instance_exists(obj_results))
                        {
                            switch(obj_results.result)
                            {
                                case 0: state_text = "Exe Killed Everyone"; details_text = "Victory for Exe"; large_image = "exewin"; large_text = "Exe Wins"; break;
                                case 1: state_text = "Survivors Escaped"; details_text = "Victory for Survivors"; large_image = "survwin"; large_text = "Survivors Win"; break;
                                case 2: state_text = "Time Over"; details_text = "Nobody escaped"; large_image = "timeover"; large_text = "Time Over"; break;
                                default: state_text = "End Of Round"; details_text = ""; large_image = "results"; large_text = "Results"; break;
                            }
                        }
                        break;
                    case room_message:
                        state_text = "Error...";
                        details_text = "";
                        large_image = "failedtoconnect";
                        large_text = "Error";
                        small_image = "";
                        small_text = "";
                        break;
                    case room_connecting:
                        state_text = "Connecting To The Server...";
                        details_text = "";
                        large_image = "connecting";
                        large_text = "Connecting";
                        small_image = "";
                        small_text = "";
                        break;
                    case room_lobby:
                        var lobby_players = 1;
                        if (instance_exists(obj_netclient))
                        {
                            lobby_players = ds_map_size(obj_netclient.players);
                            
                            if (obj_netclient.nid != -1) 
                                lobby_players += 1;
                                
                            if (lobby_players <= 0) lobby_players = 1;
                        }
                        
                        state_text = "In Lobby";
                        
                        if (lobby_players == 1)
                        {
                            details_text = "Waiting For Players... (1 of 7)";
                        }
                        else
                        {
                            details_text = "Players in Lobby (" + string(lobby_players) + " of 7)";
                        }
                        
                        large_image = "lobby";
                        large_text = "Lobby";
                        small_image = "";
                        small_text = "";
                        break;
                    case room_menu:
                        state_text = "In Menu";
                        details_text = "";
                        large_image = "menu";
                        large_text = "Main Menu";
                        small_image = "";
                        small_text = "";
                        break;
                    case room_logo:
                        state_text = "In Logo";
                        details_text = "";
                        large_image = "logo";
                        large_text = "Logo";
                        small_image = "";
                        small_text = "";
                        break;
                    default:
                        state_text = "";
                        details_text = "";
                        large_image = "td2dr-exe";
                        large_text = "";
                        small_image = "";
                        small_text = "";
                        break;
                }
            }
        }
    }

    if (instance_exists(obj_suddendeath))
    {
        if (details_text == "") details_text = "Sudden Death";
        else details_text = details_text + " - Sudden Death";
    }

    if (instance_exists(obj_level) && obj_level.state == 1)
    {
        if (details_text == "") details_text = "Chase";
        else details_text = details_text + " - Chase";
    }

	if (instance_exists(obj_achivements) && array_length(obj_achivements.changed) > 0)
    {
        if (obj_achivements.alarm[2] > 0)
        {
            if (details_text == "") details_text = "(Achievement Unlocked)";
            else details_text = details_text + " (Achievement Unlocked)";
        }
    }
    np_setpresence_timestamps(global.session_start_time, 0, false);
    
    if (!variable_global_exists("rpc_last_sig"))
        global.rpc_last_sig = "";
    
    var _sig = details_text + "|" + state_text + "|" + large_image + "|" + small_image;
    
    if (global.rpc_last_sig != _sig)
    {
        global.rpc_last_sig = _sig;
        
        np_setpresence(state_text, details_text, large_image, small_image);
        np_setpresence_more(small_text, large_text, 0);
    }
}
