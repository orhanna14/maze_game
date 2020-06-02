require_relative "helper_methods"

class KoiPondRoom
  attr_reader :stdout, :stdin
  
  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def enter
    stdout.puts("You've entered the koi pond room. There is a door on the other side of the room that is locked.")
  end

  def navigate(items)
    stdout.puts("Do you have a key you can use?")
    truth = get_user_input
      if truth == 'yes'
        have_a_key?(items)
      elsif truth == 'no'
        need_a_key
      end
  end

  def need_a_key
    stdout.puts('Looks like you need to find a key first..you go back to the starting room')
    'starting room'
  end

  def have_a_key?(items)
    if items.include?('small key')
      stdout.puts("You are able to open the door!")
      return 'extra loot room'
    else
      stdout.puts("Dragons can smell lies. A trap door opens below you and you fall to your death.")
      'end game'
    end
  end
end