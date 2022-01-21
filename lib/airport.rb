require 'plane'

class Airport

  attr_reader :terminal

  def initialize
    @terminal = []
  end

  def land_plane(plane)
    @terminal << plane
    "#{plane} has landed"
  end

  def take_off(plane)
    fail 'There are no planes at the terminal' if @terminal.empty?
    @terminal.each_with_index do |gate, i|
      if gate == plane
        @terminal.delete_at(i)
      else  
        raise "This plane is not at the airport"
      end
    end 
  end
end
