class Plane

attr_reader :landed

def initialize
  @landed = false
end

def landed?
  @landed = true
end

def taken_off?
  @landed = false
end

end
