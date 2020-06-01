class ExtraLootRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("You've found some extra loot!")
  end
end