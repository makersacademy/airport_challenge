class Weather
  def generate_weather
    Kernel.rand(1..10)
  end

  def stormy?
    generate_weather >= 9 ? true : false
  end
end

# STUBBING
# allow(airport).to recieve(:stormy) false
