class Airport
  attr_accessor :planes, :weather

  def initialize
    @planes = []
    @weather = 'clear'
  end

  def dock(plane)
    @planes << plane
  end

  def get_permission_to_take_off(plane)
    return nil if @weather == 'stormy'
    @planes.index(plane)
  end
end