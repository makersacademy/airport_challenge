
class Weather

  # set up globals for weather type strings,
  # this ensures easy edit and less chance of typeos
  $sunny = "sunny"
  $stormy = "stormy"

  def self.generate

    # generate a random number 1 - 10 inclusive
    # if the number is 9 or 10 the weather is stormy,
    # otherwise weather is sunny
    return (rand(1...11) >= 9) ? $stormy : $sunny
  end

end
