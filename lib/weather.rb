class Weather

attr_reader :stormy

def stormy?
  forecast = ["stormy", "sunny", "sunny", "sunny"]
  forecast.sample
end

end
