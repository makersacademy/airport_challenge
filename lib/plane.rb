class Plane

attr_reader :flying, :permission

def initialize
  @flying = true
end

def land
  @flying = false
end

def take_off
  @flying = true
end

def have_permission?(airport)
  @permission = airport.permission
end

end
