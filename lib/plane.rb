class Plane

attr_accessor :status

def initialize
  @status = :flying
end

def flying?
  @status == :flying
end

def landed?
  @status == :landed
end

def take_off
  @status = :flying
end

def land
  @status = :landed
end


end