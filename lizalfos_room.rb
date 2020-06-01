class LizalfosRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("You've entered the lizalfos room. The door behind you and the door on the other side of the room locks with large metal bars that come down from the ceiling. Do you fight the lizalfos? Yes or no.")
  end
end