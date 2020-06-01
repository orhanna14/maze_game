require_relative "game_map"
require_relative "helper_methods"

class GameEngine
  attr_reader :stdin, :stdout, :game_map
  attr_accessor :current_room, :playing, :items

  def initialize(stdin, stdout, current_room = 'starting room', game_map = GameMap.new(stdout, stdin))
    @stdin = stdin
    @stdout = stdout
    @current_room = current_room
    @game_map = game_map
    @playing = true
    @items = []
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
    set_current_room(game_map.navigate(current_room, items))
  end
end