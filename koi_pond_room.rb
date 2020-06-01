class KoiPondRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("You've entered the koi pond room. There is a door on the other side of the room that is locked.")
  end
end