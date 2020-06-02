require_relative "helper_methods"

class BossRoom
  attr_reader :stdout, :stdin
  
  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter
    stdout.puts("You've made it to the boss room. You come in swinging your sword for a surprise attack. The dragon is caught off guard and you slice its leg. It roars back at you with fire brewing in the back of its throat.")
  end

  def navigate(items)
    stdout.puts("Do you: dodge and strike or cry?")
    fight = get_user_input
    if fight == 'dodge and strike'
      game_over_defeat
    elsif fight == 'cry'
      game_over_cry
    else 
      game_over
    end
  end

  def game_over_defeat
    stdout.puts("You've defeated the boss! Congratulations!")
    'end game'
  end

  def game_over_cry
    stdout.puts("You get a good cry in and melt the dragon's heart. You hug it out")
    'end game'
  end

  def game_over
    stdout.puts("You lose")
    'end game'
  end
end