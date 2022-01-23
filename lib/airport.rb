require './lib/plane.rb'

class Airport

  attr_accessor :capacity
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land_plane(plane)
    fail 'Bad Weather' if stormy
    @planes << plane
    "Successful Landing"
  end

  def take_off(plane)
    fail 'There are no planes at the terminal' if @planes.empty?
    fail 'Bad Weather' if stormy
    @planes.each_with_index do |gate, i|
      if gate == plane
        @planes.delete_at(i)
      else  
        "This plane is not at the airport"
      end
    end 
  end

  private

  def stormy
    condition = rand(6)
    condition == 4
  end

end
