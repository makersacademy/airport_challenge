
class Airport

  def land(plane)

  end

  def take_off(plane)
    raise 'No planes available' unless @plane
    @plane
  end
end
