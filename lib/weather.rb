class Weather

attr_reader :weather

def initialize
  @weather = rand(1..4)
end

def stormy?
  self.weather == 1
end

end

# irb -r './lib/weather.rb'