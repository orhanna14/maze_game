require_relative "helper_methods"

class RiddleRoom
  attr_reader :stdout, :stdin
  
  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter
    stdout.puts("You've entered the riddle room. There is an ancient invention, still used in some parts of the world today, that allows people to see through walls. What is it?")
  end

  def navigate(items)
    answer = get_user_input
    if answer == 'a window'
      'key room'
    else
      game_over
    end
  end

  def game_over
    stdout.puts("Wrong. A trap door opens up beneath you and you fall to your death.")
    'end game'
  end
end