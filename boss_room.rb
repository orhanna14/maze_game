class BossRoom
  attr_reader :stdout
  
  def initialize(stdout)
    @stdout = stdout
  end

  def enter
    stdout.puts("You've made it to the boss room. You come in swinging your sword for a surprise attack. The dragon is caught off guard and you slice its leg. It roars back at you with fire brewing in the back of its throat.")
  end
end