class Weather

attr_reader :stormy

def initialize
  @stormy = stormy?
end

def stormy?
  rand(4) == 1
end

end
