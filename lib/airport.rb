require_relative 'Forecaster'

class Airport

  attr_reader :grounded_planes, :capacity
  
  @@messages = {
    :landed => "Plane has landed.",
    :departed => "Plane has departed.",
    :wrong_request => "Unrecognised request.",
    :stormy => "Stormy weather.",
    :full_capacity => "Airport at full capacity.",
    :negative_capacity => "Capacity can't be set to a negative value.",
    :unknown_plane => "Plane not at this airport.",
  }

  def initialize(capacity = 20)
    @grounded_planes = []
    @forecaster = Forecaster.new
    @capacity = capacity
  end

  def request(request_type, plane)
    return land(plane) if request_type == :landing
    return take_off(plane) if request_type == :take_off
    engage(:wrong_request)
  end

  def override_capacity(size)
    return @capacity = size if size >= 0
    engage(:negative_capacity)
  end

  def increase_capacity(increase)
    @capacity += increase
  end

  def decrease_capacity(decrease)
    return engage(:negative_capacity) if decrease > @capacity
    @capacity -= decrease
  end

private

  def land(plane)
    return false if no_landing_conditions?
    @grounded_planes << plane
    engage(:landed)
    return true
  end

  def take_off(plane)
    return false if no_take_off_conditions?(plane)
    @grounded_planes.delete(plane)
    engage(:departed)
    return true
  end

  def engage(message)
    puts @@messages[message]
  end

  def stormy?
    return false unless @forecaster.current_forecast
    engage(:stormy)
    return true
  end
  
  def no_landing_conditions?
    return stormy? || full?
  end

  def no_take_off_conditions?(plane)
    return stormy? || unknown?(plane)
  end

  def full?
    return false if @grounded_planes.size < @capacity
    engage(:full_capacity)
    return true
  end

  def unknown?(plane)
    return false if @grounded_planes.include?(plane)
    engage(:unknown_plane)
    return true
  end

end
