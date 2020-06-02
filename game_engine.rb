require_relative "game_map"
require_relative "helper_methods"

class GameEngine
  attr_reader :stdin, :stdout, :game_map
  attr_accessor :current_room, :playing, :items

  def initialize(stdin, stdout, current_room = 'starting room')
    @stdin = stdin
    @stdout = stdout
    @current_room = current_room
    @playing = true
    @items = []
    @game_map = GameMap.new(stdout, stdin)
  end

  def run
    while playing
      enter_room
      navigate
    end
  end

  def enter_room
    game_map.enter(current_room)
  end

  def navigate
    if current_room == 'starting room' || current_room == 'lizalfos room' || current_room == 'riddle room' || current_room == 'koi pond room' || current_room == 'boss room'
      set_current_room(game_map.navigate(current_room, items))
    elsif current_room == 'key room'
      add_to_items('small key')
      stdout.puts("Do you want to go back to the starting room? Yes or no.")
      direction = get_user_input
      if direction == 'yes'
        set_current_room('starting room')
      else
        stdout.puts("You must be paranoid. You lost your mind in the riddle room. You lose")
        end_game?(false)
      end
    elsif current_room == 'extra loot room'
      add_to_items('extra loot')
      stdout.puts("Along with extra loot, you find a large key that you put in your pocket. You go back to the starting room.")
      add_to_items('boss key')
      set_current_room('starting room')
    end
  end

 #If the game is over, set playing = false. 

  def set_current_room(current_room)
    @current_room = current_room
  end

  def end_game?(playing)
    @playing = playing
  end

  def add_to_items(item)
    @items = items.push(item)
  end
end