require 'plane'
class Airport

  attr_reader :planes

  def initialize
    @weather = 'sunny'
    @planes = []
  end

  def plane_land (plane)
    raise 'the plane cannot land as the weather is stormy' if weather?(rand(6)) == 'stormy'
    @planes << plane
  end

  private

  def weather? (random_number)
    random_number + 1 < 6 ? 'sunny' : 'stormy'
  end

end