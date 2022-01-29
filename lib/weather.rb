class Weather

def initialize
   @condition = rand(1..4)
end

def stormy?
  @condition <= 1
end

end