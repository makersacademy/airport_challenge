class Plane
attr_reader :status, :airborne

def initialize(status='no status')
  @status = status
end

def airborne
  @status = 'flying'
end

def landed
  @status = 'landed'
end


end
