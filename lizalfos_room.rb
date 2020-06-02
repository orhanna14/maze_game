require_relative "helper_methods"

class LizalfosRoom
  attr_reader :stdout, :stdin
  
  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter
    stdout.puts("You've entered the lizalfos room. The door behind you and the door on the other side of the room locks with large metal bars that come down from the ceiling. Do you fight the lizalfos? Yes or no.")
  end

  def navigate(items)
    fight = get_user_input
      if fight == 'yes'
        encounter
      elsif fight == 'no'
        game_over
      else
        stdout.puts("Please enter yes or no.")
      end
  end

  def encounter
    stdout.puts("You've defeated the Lizalfos! The metal bars are pulled up through the ceiling, allowing you to go back the way you came, or forward to another room. Which way do you go?")
      direction = get_user_input
      if direction == 'forward'
        'riddle room'
      elsif direction == 'back'
        'starting room'
      else
        stdout.puts("Please enter forward or back.")
      end
  end

  def game_over
    stdout.puts("The Lizalfos have defeated you! You lose.")
    'end game'
  end

end