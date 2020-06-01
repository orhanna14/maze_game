class KeyRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("Hurray, a key has appeared! You put it in your pocket. The only way to go is back the way you came.")
  end
end