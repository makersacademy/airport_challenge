class Plane

def initialize
  @status = :flying
end

def flying?
  @status == :flying
end

def landed?
  @status != :flying
end

def land_at(airport)
  @status = airport
end

def take_off_from(airport)
  @status = :flying
end

end
