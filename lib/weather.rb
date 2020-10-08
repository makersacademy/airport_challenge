class Weather

attr_reader :status

def initialize
  if (1..9).include?(randomizer)
    @status = "sunny"
  else
    @status = "STORMY"
  end
end

def randomizer
  rand(1..10)
end

end
