require_relative 'plain.rb'

class Airport

  def initialize
    @plains = []
  end

  def arrival(plane)
    @plains << plane
    @plains.length
  end

  def departure
    @plains.pop
    @plains.length
  end

end
