class Weather

attr_accessor :stormy

def initialize
  @stormy = false
  @stormy = true if rand(10) == 1
end

def stormy?
@stormy
end

end
