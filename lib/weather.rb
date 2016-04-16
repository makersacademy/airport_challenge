class Weather

initialize do
  @stormy = false
  @stormy = true if rand(10) == 1
end

def stormy?
@stormy
end

end
