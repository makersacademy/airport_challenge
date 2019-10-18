class Airport
  attr_accessor :planes, :weather

  def initialize
    @planes = []
    @weather = 'clear'
  end

  def dock(plane)
    raise 'Plane is already docked' if @planes.include? plane
    @planes << plane
  end

  def get_permission_to_take_off(plane)
    raise 'Plane is not docked' unless @planes.include? plane
    return nil if @weather == 'stormy'
    @planes.index(plane)
  end
end