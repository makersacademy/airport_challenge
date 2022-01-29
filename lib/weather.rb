class Weather

attr_reader :stormy

def initialize
  @condition = rand(1..6)
end

def stormy?
  if @condition <= 2
  @stormy = true
  end
end

end