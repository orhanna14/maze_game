require_relative "starting_room"
require_relative "lizalfos_room"
require_relative "koi_pond_room"
require_relative "key_room"
require_relative "riddle_room"
require_relative "extra_loot_room"
require_relative "boss_room"

class GameMap
  attr_reader :stdout, :stdin, :current_room

  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter(current_room)
    rooms[current_room].enter
  end

  def navigate(current_room, items)
    rooms[current_room].navigate(items)
  end

  private
  def rooms
    {'starting room' => starting_room, 'lizalfos room' => lizalfos_room, 'koi pond room' => koi_pond_room, 'key room' => key_room, 'riddle room' => riddle_room, 'extra loot room' => extra_loot_room, 'boss room' => boss_room}
  end

  def starting_room
    StartingRoom.new(stdout, stdin)
  end

  def lizalfos_room
    LizalfosRoom.new(stdout, stdin)
  end

  def koi_pond_room
    KoiPondRoom.new(stdout, stdin)
  end

  def riddle_room
    RiddleRoom.new(stdout, stdin)
  end

  def key_room
    KeyRoom.new(stdout)
  end

  def extra_loot_room
    ExtraLootRoom.new(stdout)
  end
  
  def boss_room
    BossRoom.new(stdout, stdin)
  end

end