require_relative 'airport'

class Plane
attr_reader :flying


def initialize 
    @flying = true
end

def land
  @flying = false
end

def take_off
  @flying = true
end

def flying?
  @flying
end

end