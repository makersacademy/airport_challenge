require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :plane
  attr_accessor :capacity, :weather

  def initialize
    @capacity = 20
    @plane = []
    @weather = Weather.new
  end

  def release_plane
    fail 'No planes bitches!' unless @plane
    @plane
  end

  def dock(plane)
    fail 'Full' if @plane
    @plane = plane
  end
end