class Weather

attr_reader :random_weather

def initialize
  @random_weather = generate_weather
end

def generate_weather
  @random_weather = rand(1..6)
end

end
