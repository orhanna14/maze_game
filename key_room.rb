require_relative "helper_methods"

class KeyRoom
  attr_reader :stdout, :stdin
  
  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter
    stdout.puts("Hurray, a key has appeared! You put it in your pocket. The only way to go is back the way you came.")
  end

  def navigate(items)
    add_to_items('small key')
    stdout.puts("Do you want to go back to the starting room? Yes or no.")
    direction = get_user_input
    if direction == 'yes'
      return 'starting room'
    else
      stdout.puts("You must be paranoid. You lost your mind in the riddle room. You lose")
      end_game(false)
    end
  end
end