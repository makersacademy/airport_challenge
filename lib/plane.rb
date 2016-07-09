require_relative 'airport'

class Airplane
attr_reader :landed
def initialize
  @landed = true
  @taken_off = true
end

def landed?
 @landed
end

def taken_off?
@taken_off
end

end
