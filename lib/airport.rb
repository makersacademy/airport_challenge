require "planes"

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @terminal = []
    @capacity = capacity
  end

  def plane_arrival(plane)
    fail "The airport terminal is full" if terminal_full?
    @terminal << plane if plane.at_airport? == false && !terminal_full?
  end

  def plane_departure(plane)
    fail "There are no planes at the terminal to depart." if terminal_empty?
    if @terminal.include?(plane)
      @terminal.delete(plane)
    else
      "This plane is not in our airport."
    end
  end

  def see_terminal
    @terminal
  end

  private

  def terminal_full?
    @terminal.count == @capacity
  end

  def terminal_empty?
    @terminal.empty?
  end


end
