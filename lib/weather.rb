class Weather

attr_reader :stormy

def stormy?
  @stormy = true if rand(0..50) == 5
end


end
