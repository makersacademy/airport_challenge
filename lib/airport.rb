require_relative 'plane'  # => true

class Airport

  def land(plane)
    raise 'Airport is full!' if @plane
    @plane = plane
  end

  def take_off(plane)

  end

end
