class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(planes = [], capacity = DEFAULT_CAPACITY)
    @planes = planes
    @capacity = capacity
  end

  def land(plane)
    raise "This plane is currently parked." unless plane.flying == true
    raise "The weather is too stormy to land, wait for further instructions.!" if check_stormy
    raise "This airport is full." if full?
    add_plane(plane)
  end

  def take_off(plane)
    raise "This plane is not at this airport." unless @planes.include?(plane)
    raise "The weather is too stormy to take-off, wait for further instructions.!" if check_stormy
    remove_plane(plane)
  end

  def store(plane)
    raise "This airport is full." if full?
    raise "This plane is already at this airport." if @planes.include?(plane)
    add_plane(plane)
  end

    private

  def full?
    capacity <= planes.count
  end

  def check_stormy
    Weather.new.stormy?
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def add_plane(plane)
    @planes.push(plane)
  end

end
