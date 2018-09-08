require 'plane'

class Airport

  DEFAULT_HANGER_SIZE = 20

  def initialize(hanger_size = DEFAULT_HANGER_SIZE)
    @hanger = []
    @hanger_size = hanger_size
  end

  def put_plane_in_hanger(plane)
    @hanger.push(plane)
  end

  def hanger_full?
    true if @hanger.count == @hanger_size
  end

  def bad_weather?
    # true if rand(10).zero?
    # true
    false
  end
end
