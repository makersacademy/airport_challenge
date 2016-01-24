require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :holding_bay, :capacity, :weather

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @holding_bay = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    if full?
      "The airport is full"
    else
      if @weather.sunny? && plane.flying?
        plane.change_status
        @holding_bay << plane
      else
        @weather.sunny? == false ? "Unsafe to land plane whilst stormy" : "Plane has already landed"
      end
    end
  end

  def take_off
    if empty?
      "The airport is empty"
    else
        plane = @holding_bay.pop
        if @weather.sunny? && plane.landed?
          plane.change_status
          plane
        else
          @holding_bay << plane
          @weather.sunny? == false ? "Unsafe to take off plane whilst stormy" : "This plane is already flying"
        end
    end
  end

  private

  def full?
    @holding_bay.size >= @capacity
  end

  def empty?
    @holding_bay.empty?
  end

end
