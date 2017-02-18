
class Plane

attr_reader :flying

def initialize
  @flying = true
end

def land
  @flying = false
end

def boarding
  @flying = true
end

end
