
class Airplane
attr_reader :land

def landed?
  @landed
end

def land
  raise 'Plane already landed' if landed?
  @landed = true
end

def in_airport?
  @landed = true
end

def take_off
  raise 'Plane already in the air' unless landed?
  @landed = false
end

def taken_off?
  @landed ? false : true
end
end
