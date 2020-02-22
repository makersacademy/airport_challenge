require_relative 'airport'

class Plane
    
attr_reader :location 

def initialize
  @location = :sky

end

def flying?
  @location = :sky
end

def landed
  @location = :airport
end

def flying
  @location = :sky
end

end