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
    if current_room == 'starting room'
      starting_room.enter
    elsif current_room == 'lizalfos room'
      lizalfos_room.enter
    elsif current_room == 'koi pond room'
      koi_pond_room.enter
    elsif current_room == 'key room'
      key_room.enter
    elsif current_room == 'riddle room'
      riddle_room.enter
    elsif current_room == 'extra loot room'
      extra_loot_room.enter
    elsif current_room == 'boss room'
      boss_room.enter
    end
  end

  def navigate(current_room, items)
    if current_room == 'starting room'
      starting_room.navigate(items)
    elsif current_room == 'lizalfos room'
      lizalfos_room.navigate(items)
    elsif current_room == 'koi pond room'
      koi_pond_room.navigate(items)
    elsif current_room == 'key room'
      key_room.navigate(items)
    elsif current_room == 'riddle room'
      riddle_room.navigate(items)
    elsif current_room == 'extra loot room'
      extra_loot_room.navigate(items)
    elsif current_room == 'boss room'
      boss_room.navigate(items)
    end
  end

  private
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
    KeyRoom.new(stdout, stdin)
  end

  def extra_loot_room
    ExtraLootRoom.new(stdout, stdin)
  end
  
  def boss_room
    BossRoom.new(stdout, stdin)
  end
end