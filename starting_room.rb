require_relative "helper_methods"

class StartingRoom
  attr_reader :stdout, :stdin
  
  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter
    stdout.puts("You've entered the dragon's fortress. You are equipped with a sword and shield. You see a door to your left and a door to your right. Neither of them appear to be locked. You also see a door ahead of you that has a big lock on it.")
  end

  def navigate(items)
    if items.include?('boss key')
      stdout.puts('You use the large key to open the large door ahead of you.')
      'boss room'
    else
      stdout.puts("Which way do you go?")
      direction = get_user_input
      if direction == 'left'
        'lizalfos room'
      elsif direction == 'right'
        'koi pond room'
      else
        stdout.puts("Please enter left or right.")
        'starting room'
      end
    end
  end

end