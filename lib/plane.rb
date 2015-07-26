class Plane


attr_accessor :airborne

def initialize
  @airborne = :up
end

def flying?
  @airborne == :up
end


def fly_away
  @airborne = :up
  self
  #self
end

def ground
  @airborne = :downed
  self
  #self
end

end
