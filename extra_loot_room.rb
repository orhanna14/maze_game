require_relative "helper_methods"

class ExtraLootRoom
  attr_reader :stdout, :stdin
  
  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter
    stdout.puts("You've found some extra loot!")
  end

  def navigate(items)
    add_to_items('extra loot')
    stdout.puts("Along with extra loot, you find a large key that you put in your pocket. You go back to the starting room.")
    add_to_items('boss key')
    return 'starting room'
  end
end