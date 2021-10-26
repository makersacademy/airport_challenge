require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    raise "Airport capacity must be a positive integer" if not_positive_integer?(capacity)
    
    @capacity = capacity
    @planes = Array.new
    @weather = Weather.new
  end

  def hangar
    @planes.each { |plane| plane.to_s }.join ", "
  end

  def land(plane)
    @plane = plane
    landing_checks
    plane_on_ground?(true)
  end

  def take_off(plane)
    @plane = plane
    take_off_checks
    plane_on_ground?(false)
  end

  def contains?(plane)
    @planes.include?(plane)
  end

  private

  def not_positive_integer?(capacity)
    !capacity.is_a?(Integer) || capacity < 1
  end

  def landing_checks
    raise "That plane is already on the ground!" if @plane.on_ground

    raise "Landing not permitted: airport full!" if full?
    
    check_weather("Landing")
  end

  def take_off_checks
    raise "That plane is already in the air!" unless @plane.on_ground
    
    raise "That plane is at a different airport!" unless contains?(@plane)

    check_weather("Take off")
  end

  def plane_on_ground?(status)
    @plane.report_location(status)
    status == true ? @planes << @plane : @planes.delete(@plane)
    @plane
  end

  def full?
    @planes.size == @capacity
  end

  def check_weather(action)
    raise "#{action} not permitted when weather is stormy" if weather.stormy?
  end

end
