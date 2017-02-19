require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather

  CAPACITY = 15

  def initialize(capacity = CAPACITY)
  @capacity = capacity
  @planes = []
  @stormy = Weather.new.storm? == :stormy
  end

  def landing(plane)
    raise 'No more room for planes' if airport_full?
    raise 'Stormy weather, cannot land' if @stormy
      plane.landed
      @planes << plane
      "The #{plane} has landed!"
  end

  def boarding
    raise 'The airport has no more planes' if @planes.empty?
    raise 'Sorry, weather too stormy' if @stormy
      boarding_plane = @planes.pop
      boarding_plane.flight
      @planes.push(boarding_plane)
      @planes.pop
      "The #{boarding_plane} has boarded to its destination!"
  end

  def confirm_boarding(plane)
    raise 'This plane has boarded' if @planes.include?(plane)
    "#{plane} has departed to its destination"
  end

  def confirm_landing(plane)
    raise 'This plane is not at the airport' if !@planes.include?(plane)
    "#{plane} has landed at its destination"
  end


  private

  def airport_full?
    @planes.length >= @capacity
  end


end
