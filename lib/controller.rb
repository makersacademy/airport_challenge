class Controller
  # Understands how to control inbound and outbound planes
  attr_accessor :airport, :weather, :planes_inbound, :planes_outbound

  def initialize(airport, weather, planes = [])
    @airport = airport
    @weather = weather
    @planes_inbound = planes
    @planes_outbound = []
  end

  def issue_landing_instruction
    raise "No inbound planes" if @planes_inbound.count.zero?
    raise "Landing not possible at the moment" unless landing_enabled
    @airport.land(@planes_inbound.pop)
  end

  def issue_takeoff_instruction
    raise "Take off not possible at the moment" unless takeoff_enabled
    @planes_outbound << @airport.takeoff
  end

  def landing_enabled
    return false if weather.stormy?
    return false if airport.full?
    return true
  end

  def takeoff_enabled
    return false if weather.stormy?
    return false if airport.empty?
    return true
  end
end
