class Plane

def initialize
  @airborne = true
end

def fly
end

def flying?
  @airborne
end

def landed?
  !flying?
end

end
