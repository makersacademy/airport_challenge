require_relative 'plane'
require_relative 'weather'
require_relative 'controller'

class Airport
  attr_reader :planes, :capacity, :weather

  CAPACITY = 15

  def initialize(capacity = CAPACITY)
  @capacity = capacity
  @planes = []
  @weather = Weather.new.storm?
  end

  def landing(plane)
    raise 'No more room for planes' if airport_full?
    raise 'Stormy weather, cannot land' if @weather
      plane.landed
      @planes << plane
      "#{plane} has landed!"
  end

  def boarding
    raise 'The airport has no more planes' if @planes.empty?
    raise 'If array of planes are empty, cannot take of without a plane' if @planes.empty?
    raise 'Sorry, weather too stormy' if @weather
      boarding_plane = @planes.pop
      boarding_plane.flight
      @planes.push(boarding_plane)
      @planes.pop
      "#{boarding_plane} has boarded!"
  end

  private

  def airport_full?
    @planes.length >= @capacity
  end


end
