class Weather

  attr_reader :current_state

  def initialize
    randomise
  end

  def now
    @current_state
  end

  def state(state)
    @current_state = state
    self
  end

  private

  def randomise
    n = rand(10)
    @current_state = 'sunny' if n > 2
    @current_state = 'stormy' if n <= 2
    @current_state
  end

end
