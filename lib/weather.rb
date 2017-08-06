class Weather


  attr_reader :now

  def initialize
    @current_state = 'clear'
  end

  def randomise
    n = rand(100)
    p n
    @current_state = 'sunny' if n > 20
    @current_state = 'stormy' if n <= 20
    @current_state
  end

  def now
    @current_state
  end

  def states
    @states = ['sunny', 'stormy']
  end

end