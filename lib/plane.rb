class Plane

attr_reader :on_the_ground

def initialize
  @on_the_ground = false
end

def landed
  @on_the_ground = true
end

def taken_off
  @on_the_ground = false
end


end
