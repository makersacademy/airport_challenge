class Airport

  def initialize(y = 15)
    @hanger = []
    @capacity = y
  end

  attr_reader :hanger, :capacity

  def land(plane, weather)
    if full?
      raise 'The airport is full!'
    else
      @hanger << plane
    end
  end


  def take_off(weather)
    if weather == "It's clear!"
      if @hanger.empty?
        raise 'There are no planes in the hanger!'
      else
        @hanger.pop
      end
    elsif weather == "It's stormy!"
      raise "The conditions aren't good enough!"
    end
  end

  private

  def full?
    return false if @hanger.length < @capacity
    return true
  end

end
