module AirController
  attr_writer :capacity
  DEFAULT_CAPACITY = 5

  def planes
    @planes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def landing_plane(plane)
    fail "The Airport is full" if full?
    planes << plane
  end

  def taking_off_plane
    fail "No planes at the airport" if empty?
    planes.pop
  end

  # def planes_count
  #   planes.length
  # end

  private

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end

end
