class Plane

end

class Airport
  attr_reader :hangar
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def full?
    @hangar.length >= @capacity
  end

  def observe_weather
    rand(4).zero? ? :stormy : :sunny
  end

  def land(plane)
    weather = observe_weather
    if weather == :stormy
      puts "Until the weather conditions are favorable, no landings authorized."
      @hangar
    else
      puts "#{plane} has landed in Manises airport and is ready for inspection."
      @hangar << plane
    end
  end

  def take_off(plane)
    weather = observe_weather
    if weather == :stormy
      puts "Until the weather conditions are favorable, no takeoffs authorized."
      @hangar
    else
      @hangar -= [plane]
    end
  end

  def confirmation_of_departure(plane)
    if @hangar.include? plane
      puts "The #{plane} did not take off."
      false
    else
      puts "Control Tower confirming the departure of #{plane}."
      true
    end
  end
end
