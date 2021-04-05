class Airport
  attr_accessor :hangar

  def initialize(default_capacity = 1)
    @hangar = []
    @CAPACITY = default_capacity
  end

  def take_in_plane(plane)
    #also prevent dockng above capacity
    # fail 'this plane already docked' if @hangar.include?(plane)
    fail 'DOCKED ALREADY' if plane.dock_status == true
    fail 'full' if full?
    plane.dock
    #RuntimeError (full)
    @hangar.push(plane)
  end

  def empty?
    return @hangar.length == 0
  end

  def full?
    return @hangar.length == @CAPACITY
  end
end
