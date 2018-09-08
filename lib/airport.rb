require 'plane'

class Airport

  DEFAULT_HANGER_SIZE = 20

  def initialize
    @hanger = []
  end

  def put_plane_in_hanger(plane)
    @hanger.push(plane)
  end

  def hanger_full?
    true if @hanger.count == DEFAULT_HANGER_SIZE
  end

  def bad_weather?
    # true if rand(10).zero?
    # true
    false
  end
end
