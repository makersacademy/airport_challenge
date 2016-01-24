require_relative 'Aircraft'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    puts "CONFIRMATION: Flight #{plane} has landed successfully."
  end

end
