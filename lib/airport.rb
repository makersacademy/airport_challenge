require_relative './plane'

class Airport

DEFAULT_CAPACITY = 20

attr_reader :planes, :weather


  def initialize
    @planes = []
    @weather = rand(10)
      if @weather < 2
        @weather = 'sunny'
      else
        @weather = 'stormy'
      end
  end

  def land_plane(plane)
    fail 'weather is stormy, cannot land plane' if stormy?
    fail 'airport is full' if full?
    @planes << plane
  end

  def plane_depart
    fail 'weather is stormy, cannot depart plane' if stormy?
    fail 'airport is empty' if empty?
    @planes.pop
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def stormy?
    @weather == 'stormy'
  end

end
