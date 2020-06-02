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
      game_over?
    end
  end

  def enter_room
    game_map.enter(current_room)
  end

  def navigate
    set_current_room(game_map.navigate(current_room, items))
  end

  def set_current_room(current_room)
    @current_room = current_room
  end

  def game_over?
    if current_room == 'end game'
      @playing = false
    end
  end
end