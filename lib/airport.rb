require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 15

  def initialize
    @planes = []
  end

  def capacity
    @capacity = DEFAULT_CAPACITY
  end

  def requesting_take_off
    if empty?
      fail 'No planes to take off!'
    elsif forecast == 'stormy'
      fail 'It\'s too stormy to fly!'
    else
      plane = @planes.pop
      plane.take_off
    end
  end

  def empty?
    @planes.empty?
  end

  def landing plane
    if @planes.count >= DEFAULT_CAPACITY
      fail 'The airport is full!'
    elsif forecast == 'stormy'
      fail 'It\'s too stormy to land!'
    else
      plane.land
      @planes << plane
    end
  end

  def weather
    rand(6)
  end

  def forecast
    if weather == 5
      'stormy'
    else
      'sunny'
    end
  end


end
