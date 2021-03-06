///Combination
//Select materials
if(!instance_exists(obj_msg_instruction1) && !instance_exists(obj_msg_instruction2)){
    randomize();
    if (keyboard_check_pressed(ord("1"))){
      with(obj_inv_combine_effect)
        instance_destroy();
      if (global.mat_fire > 0 && global.selected < 3){
        global.mat_selected[global.selected] = 1;
        global.mat_fire -= 1;
        global.selected += 1;
        show_debug_message("1 - selected = " + string(global.selected))
      }
    }
    if (keyboard_check_pressed(ord("2"))){
      with(obj_inv_combine_effect)
        instance_destroy();
      if (global.mat_wind > 0 && global.selected < 3){
        global.mat_selected[global.selected] = 2;
        global.mat_wind -= 1;
        global.selected += 1;
        show_debug_message("2 - selected = " + string(global.selected))
      }
    }
    if (keyboard_check_pressed(ord("3"))){
      with(obj_inv_combine_effect)
        instance_destroy();
      if (global.mat_thunder > 0 && global.selected < 3){
        global.mat_selected[global.selected] = 3;
        global.mat_thunder -= 1;
        global.selected += 1;
        show_debug_message("3 - selected = " + string(global.selected))
      }
    }
    if (keyboard_check_pressed(ord("4"))){
      with(obj_inv_combine_effect)
        instance_destroy();
      if (global.mat_ice > 0 && global.selected < 3){
        global.mat_selected[global.selected] = 4;
        global.mat_ice -= 1;
        global.selected += 1;
        show_debug_message("4 - selected = " + string(global.selected))
      }
    }
    //Putting materials for combination
    if (keyboard_check_pressed(ord("E"))){
      with(obj_inv_combine_effect)
        instance_destroy();
      for(i = 0; i < 3; i+=1){
        switch(global.mat_selected[i]){
          case 1:
            global.mat_fire += 1;
            break;
          case 2:
            global.mat_wind += 1;
            break;
          case 3:
            global.mat_thunder += 1;
            break;
          case 4:
            global.mat_ice += 1;
            break;
        }
      }
      global.mat_selected[0] = 0;
      global.mat_selected[1] = 0;
      global.mat_selected[2] = 0;
      global.selected = 0;
    }
    //Combine
    if (keyboard_check_pressed(ord("Q")) && global.selected == 3){
      with(obj_inv_combine_effect)
        instance_destroy();
      global.created = global.mat_selected[irandom_range(0, 2)];
      global.mat_selected[0] = 0;
      global.mat_selected[1] = 0;
      global.mat_selected[2] = 0;
      global.selected = 0;
      show_debug_message("created tower index = " + string(global.created));
      
      // combine effect
      inst = instance_create(32 * 16, 1568 + 64, obj_inv_combine_effect);
      inst.image_speed = 3;
      inst.depth = 1
      
      switch(global.created){
        case 1:
          global.tower_fire += 1;
          break;
        case 2:
          global.tower_wind += 1;
          break;
        case 3:
          global.tower_thunder += 1;
          break;
        case 4:
          global.tower_ice += 1;
          break;
      }
    }
}
