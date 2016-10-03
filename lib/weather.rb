# require 'Prime'

class Weather
  def stormy?
    # Prime.prime?(rand(10)) #chance of stormy weather is 2/5
    rand(10) == 1
  end
end
