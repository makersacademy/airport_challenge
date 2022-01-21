require 'plane'

class Airport

  attr_accessor :capacity
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
    "#{plane} has landed"
  end

  def take_off(plane)
    fail 'There are no planes at the terminal' if @planes.empty?
    @planes.each_with_index do |gate, i|
      if gate == plane
        @planes.delete_at(i)
      else  
        raise "This plane is not at the airport"
      end
    end 
  end
end
