function scr_discord_rpc()
{
    if (!global.discord_initialized) exit;
    
    var state_text = "";
    var details_text = "";
    var large_image = "td2dr-exe";
    var large_text = "";
    var small_image = "";
    var small_text = "";

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
                case "HideAndSeek2": 
                    level_name = "Hide and Seek Act 2";
                    level_image = "hs2";
                    break;
                    
                case "RavineMist":
                    level_name = "Ravine Mist";
                    level_image = "rm";
                    break;

                case "DotDotDot":
                    level_name = "...";
                    level_image = "dot";
                    break;

                case "DesertTown":
                    level_name = "Desert Town";
                    level_image = "desert";
                    break;

                case "YouCantRun":
                    level_name = "You Can't Run";
                    level_image = "ycr";
                    break;

                case "LimpCity":
                    level_name = "Limp City";
                    level_image = "limpcity";
                    break;

                case "NotPerfect":
                    level_name = "Not Perfect";
                    level_image = "np";
                    break;

                case "KindaFair":
                    level_name = "Kind and Fair";
                    level_image = "knf";
                    break;

                case "Act9":
                    level_name = "Act 9";
                    level_image = "act9";
                    break;

                case "NastyParadise":
                    level_name = "Nasty Paradise";
                    level_image = "nap";
                    break;

                case "PricelessFreedom":
                    level_name = "Priceless Freedom";
                    level_image = "pf";
                    break;

                case "VolcanoValley":
                    level_name = "Volcano Valley";
                    level_image = "vv";
                    break;

                case "Hill":
                    level_name = "Hill"; 
                    level_image = "ghz";
                    break;

                case "MajinForest":
                    level_name = "Majin Forest";
                    level_image = "majinforest";
                    break;

                case "HideAndSeek":
                    level_name = "Hide and Seek";
                    level_image = "hs";
                    break;

                case "TortureCave":
                    level_name = "Torture Cave";
                    level_image = "tc";
                    break;

                case "DarkTower":
                    level_name = "Dark Tower";
                    level_image = "dkt";
                    break;

                case "HauntDream":
                    level_name = "Haunting Dream";
                    level_image = "hd";
                    break;

                case "WoodDream":
                    level_name = "Mystic Wood";
                    level_image = "wd";
                    break;

                case "Marijuna":
                    level_name = "Echidna Ruins";
                    level_image = "mj";
                    break;

                case "Fart": 
                    level_name = "Testing Place";
                    level_image = "fartzone";
                    break;
            }
            
            state_text = "On map: " + level_name;
            
            var character_name = "";
            var is_exe = (global.character == CHARACTER_EXE);
            var character_image = "td2dr-exe";
            
            if (is_exe)
            {
                switch(global.exeCharacter)
                {
                    case EXE_ORIGINAL:
                        character_image = "exe";
                        character_name = "Sonic.exe";
                        break;
                    case EXE_CHAOS:
                        character_image = "napochaos";
                        character_name = "Chaos";
                        break;
                    case EXE_EXETIOR:
                        character_image = "exetior";
                        character_name = "Exetior";
                        break;
                    case EXE_EXELLER:
                        character_image = "exeller";
                        character_name = "Exeller";
                        break;
                    default:
                        character_image = "hander";
                        character_name = "Hander";
                        break;
                }
                details_text = "Playing as " + character_name;
            }
            else
            {
                switch(global.character)
                {
                    case CHARACTER_TAILS:
                        character_image = "tails";
                        character_name = "Tails";
                        break;
                    case CHARACTER_KNUX:
                        character_image = "knux";
                        character_name = "Knuckles";
                        break;
                    case CHARACTER_EGGMAN:
                        character_image = "egg";
                        character_name = "Eggman";
                        break;
                    case CHARACTER_AMY:
                        character_image = "amy";
                        character_name = "Amy";
                        break;
                    case CHARACTER_CREAM:
                        character_image = "cream";
                        character_name = "Cream";
                        break;
                    case CHARACTER_SALLY:
                        character_image = "sally";
                        character_name = "Sally";
                        break;
                    default:
                        character_image = "unknow";
                        character_name = "?";
                        break;
                }
                details_text = "Playing as " + character_name;
            }
            
            large_image = level_image;
            large_text = level_name;
            small_image = character_image;
            small_text = character_name;
            break;
        }
    }

    if (!is_level)
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
                state_text = "End Of Round (Results)";
                details_text = "";
                large_image = "results";
                large_text = "Results";
                small_image = "";
                small_text = "";
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
                state_text = "In Lobby";
                details_text = "";
                large_image = "lobby";
                large_text = "Lobby";
                small_image = "";
                small_text = "";
                break;
            
            case room_menu:
                state_text = "In Menu";
                details_text = "";
                large_image = "menu";
                large_text = "Menu";
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
    np_setpresence(details_text, state_text, large_image, small_image);
}
