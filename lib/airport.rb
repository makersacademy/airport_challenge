require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def dock_landing_plane(plane)
    weather = check_weather
    if full?
      fail 'Hangar is full'
    elsif weather == 'stormy'
      fail 'Weather is stormy'
    else
      @hangar << plane
    end
  end

  def release_for_takeoff
    weather = check_weather
    if empty?
      fail 'No planes in hangar'
    elsif weather == 'stormy'
      fail 'Weather is stormy'
    else 
      @hangar.pop
    end
  end

  def check_weather
    ['stormy','sunny'].sample
  end

  private

  def full?
    @hangar.count >= capacity
  end

  def empty?
    @hangar.empty?
  end
end
