require './docs/plane.rb'

class Airport

  attr_reader :planes

  attr_accessor :capacity, :sunny #Ultimately the air traffic controller has the
                                  #ability to override current weather conditions

  DEFAULT_CAPACITY = 15

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @sunny = true
    @capacity = capacity
  end

  def land(plane)
    raise "That plane has already landed!" unless plane.flying
    raise "This airport is full, please redirect to closest airport" if full?
    raise "Weather is too dangerous to land!" unless sunny
      plane.landed
      planes << plane
  end

  def take_off(x)
      raise "There are no planes in the airport!" if empty?
      raise "Weather is too dangerous to depart!" unless sunny
        planes[x - 1].depart
        planes.delete(planes[x - 1])
  end

  def weather_report
    rand(5) < 2 ? stormy : clear
  end

private

  def stormy
    @sunny = false
    "Looks like there's a storm a-brewin'!"
  end

  def clear
    @sunny = true
    "Sky's all clear from here"
  end

  def full?
    planes.length >= capacity ? true : false
  end

  def empty?
    planes.empty? ? true : false
  end

end
