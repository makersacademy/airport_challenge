require_relative './plane'
require_relative './weather'


class Airport
  DEFAULT_CAPACITY = 5
   attr_reader :capacity, :landing_slots

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landing_slots = []
  end

  def conditions_good?
    (Weather.new).stormy?
  end

  def land(plane)
    @plane = plane
    if @plane.landed == true
      return "This plane has alredy landed"
    elsif space_to_land? != true
      return "No more landing space"
    elsif conditions_good?
      return "Weather too bad to land"
    else
      taxi_to_space
    end
  end

    def take_off(plane)
      @plane = plane
      if @plane.landed != true
        return "This plane has already taken off"
      elsif conditions_good?
        return "Weather too bad to take off"
      else
        clear_for_take_off
      end
    end

  def space_to_land?
    (@capacity - @landing_slots.count) > 0
  end

  private 

  def clear_for_take_off
    @landing_slots.delete(@plane)
    "#{@plane} has taken off"
  end

  def taxi_to_space
    @landing_slots << @plane.landed=true
    "#{@plane} has landed"
  end

end
