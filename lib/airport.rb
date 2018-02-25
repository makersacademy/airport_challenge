require './lib/plane.rb'

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

  def plane_in_hangar?(plane)
    @hangar.include? plane
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
      fail "Sorry, the hangar is full." if full?
      fail "This plane is already in the hangar." if plane_in_hangar?(plane)
      puts "#{plane} landed in Manises airport and is ready for inspection."
      @hangar << plane
    end
  end

  def take_off(plane)
    weather = observe_weather
    if weather == :stormy
      puts "Until the weather conditions are favorable, no takeoffs authorized."
      @hangar
    else
      fail "This plane is not in the hangar." unless plane_in_hangar?(plane)
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
