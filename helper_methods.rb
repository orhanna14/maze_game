def set_current_room(current_room)
  @current_room = current_room
end

def end_game(playing)
  @playing = playing
end

def add_to_items(item)
  @items = @items.push(item)
end

def get_user_input
  stdin.gets.chomp
end