class Plane
def land
@landed = true

end

def landed?
  @landed
end

def takeoff
@landed = false
end
end
