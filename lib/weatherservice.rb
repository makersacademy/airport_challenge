class Weatherservice

def initialize (random=Random.new)
  @random = random
end

def weather
  if @random.rand(10) == 5
    "stormy"
  else
    "sunny"
  end
end

end