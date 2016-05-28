require_relative "planes"

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @terminal = []
    @capacity = capacity
  end

  def plane_arrival(plane)
    raise "The airport terminal is full" if terminal_full?
    @terminal << plane if plane.at_airport? == false && !terminal_full?
  end

  def plane_departure
    @terminal.pop if @terminal[-1].at_airport?
  end

  def see_terminal
    @terminal
  end

  private

  def terminal_full?
    @terminal.count == @capacity
  end

end
