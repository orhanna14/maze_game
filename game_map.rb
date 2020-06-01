class GameMap
  attr_reader :stdout, :current_room

  def initialize(stdout, current_room)
    @stdout = stdout
    @current_room = current_room
  end

  def enter
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

  private
  def starting_room
    StartingRoom.new(stdout)
  end

  def lizalfos_room
    LizalfosRoom.new(stdout)
  end

  def koi_pond_room
    KoiPondRoom.new(stdout)
  end

  def riddle_room
    RiddleRoom.new(stdout)
  end

  def key_room
    KeyRoom.new(stdout)
  end

  def extra_loot_room
    ExtraLootRoom.new(stdout)
  end
  
  def boss_room
    BossRoom.new(stdout)
  end
end