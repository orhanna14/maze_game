class ExtraLootRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("You've found some extra loot!")
  end

  def navigate(items)
    stdout.puts("Along with extra loot, you find a large key that you put in your pocket. You go back to the starting room.")
    'starting room'
  end
end