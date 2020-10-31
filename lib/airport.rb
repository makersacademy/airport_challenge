class Airport

  def initialize(y = 15)
    @hanger = []
    @capacity = y
  end

  attr_reader :hanger, :capacity

  def land(plane, weather)
    if weather == "It's stormy!"
      return condition_error
    elsif full?
      raise 'The airport is full!'
    else
      @hanger << plane
    end
  end


  def take_off(weather)
    if weather == "It's stormy!"
      return condition_error
    elsif @hanger.empty?
      raise 'There are no planes in the hanger!'
    else
      @hanger.pop
    end
  end

  private

  def condition_error
    raise "The conditions aren't good enough!"
  end


  def full?
    return false if @hanger.length < @capacity
    return true
  end

end
