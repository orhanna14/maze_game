class StartingRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("You've entered the dragon's fortress. You are equipped with a sword and shield. You see a door to your left and a door to your right. Neither of them appear to be locked. You also see a door ahead of you that has a big lock on it. Which way do you go?")
  end
end