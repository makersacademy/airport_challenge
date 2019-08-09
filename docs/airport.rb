
class Airport

  attr_reader :num_of_planes



  def initialize
    @num_of_planes = []
  end

  def land
  end

  def take_off
  end

  def total_planes
    @num_of_planes.count
  end
end
