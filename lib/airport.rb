require_relative 'plane.rb'

class Airport

def initialize
  @apron = []
end

def full?
  @apron.count >= 10
end

def park(plane)
  @apron << plane
end

end
