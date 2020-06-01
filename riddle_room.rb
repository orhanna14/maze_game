class RiddleRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("You've entered the riddle room. There is an ancient invention, still used in some parts of the world today, that allows people to see through walls. What is it?")
  end
end