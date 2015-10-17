module Weather

attr_accessor :weather
def stormy
  @weather = rand(1..10)
  @weather >= 6 ? true : false
end

end
