class Plane

attr_reader :status, :location

def initialize
  @status = :flying
  @location = :air
end

def flying
  @status = :flying
  @location = :air
  self
end

def landed
  @status = :landed
  @location = :airport
  self
end

def flying?
  @status == :flying
end

end
