require_relative "game_map"

class GameEngine
  attr_reader :stdin, :stdout, :game_map
  attr_accessor :current_room, :playing, :items

  def initialize(stdin, stdout, current_room = 'starting room')
    @stdin = stdin
    @stdout = stdout
    @current_room = current_room
    @playing = true
    @items = []
    @game_map = GameMap.new(stdout)
  end

  def run
    while playing
      enter_room
      navigate
    end
  end

  def enter_room
    game_map.enter(current_room)
  end

  def navigate
    if current_room == 'starting room'
      if items.include?('boss key')
        stdout.puts('You use the large key to open the large door ahead of you.')
        set_current_room('boss room')
      else
        direction = stdin.gets.chomp
        if direction == 'left'
          set_current_room('lizalfos room')
        elsif direction == 'right'
          set_current_room('koi pond room')
        else
          stdout.puts("Please enter left or right.")
        end
      end
      elsif current_room == 'lizalfos room'
        fight = stdin.gets.chomp
        if fight == 'yes'
          stdout.puts("You've defeated the Lizalfos! The metal bars are pulled up through the ceiling, allowing you to go back the way you came, or forward to another room. Which way do you go?")
          direction = stdin.gets.chomp
          if direction == 'forward'
            set_current_room('riddle room')
          elsif direction == 'back'
            set_current_room('starting room')
          else
            stdout.puts("Please enter forward or back.")
          end
        elsif fight == 'no'
          stdout.puts("The Lizalfos have defeated you! You lose.")
          end_game(false)
        else
          stdout.puts("Please enter yes or no.")
        end
      elsif current_room == 'riddle room'
        answer = stdin.gets.chomp
        if answer == 'a window'
          set_current_room('key room')
        else
          stdout.puts("Wrong. A trap door opens up beneath you and you fall to your death.")
          end_game(false)
        end
      elsif current_room == 'key room'
        add_to_items('small key')
        stdout.puts("Do you want to go back to the starting room? Yes or no.")
        direction = stdin.gets.chomp
        if direction == 'yes'
          set_current_room('starting room')
        else
          stdout.puts("You must be paranoid. You lost your mind in the riddle room. You lose")
          end_game(false)
        end
      elsif current_room == 'koi pond room'
        stdout.puts("Do you have a key you can use?")
        truth = stdin.gets.chomp
          if truth == 'yes'
            if items.include?('small key')
              stdout.puts("You are able to open the door!")
              set_current_room('extra loot room')
            else
              stdout.puts("Dragons can smell lies. A trap door opens below you and you fall to your death.")
              end_game(false)
            end
          elsif truth == 'no'
            stdout.puts('Looks like you need to find a key first..you go back to the starting room')
            set_current_room('starting room')
          end
        elsif current_room == 'extra loot room'
          add_to_items('extra loot')
          stdout.puts("Along with extra loot, you find a large key that you put in your pocket. You go back to the starting room.")
          add_to_items('boss key')
          set_current_room('starting room')
        elsif current_room == 'boss room'
          stdout.puts("Do you: dodge and strike or cry?")
          fight = stdin.gets.chomp
          if fight == 'dodge and strike'
            stdout.puts("You've defeated the boss! Congratulations!")
          end_game(false)
          elsif fight == 'cry'
            stdout.puts("You get a good cry in and melt the dragon's heart. You hug it out")
          end_game(false)
          else 
            stdout.puts("You lose")
            end_game(false)
          end
    end
  end

  def set_current_room(current_room)
    @current_room = current_room
  end

  def end_game(playing)
    @playing = playing
  end

  def add_to_items(item)
    @items = items.push(item)
  end
end