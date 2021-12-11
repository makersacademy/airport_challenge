require_relative 'plane'

class Airport

  def instruct_landing(plane)
    "#{plane} landed safely"
  end

  def instruct_take_off(plane)
    @plane = plane
  end

end
