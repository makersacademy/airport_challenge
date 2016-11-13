class Weather
  attr_reader :stormy

  def initialize
    @stormy = storm
  end

  def storm
    values[random] == :stormy
  end

  def random
    rand(4)
  end

  def values
    [:stormy,:sunny,:sunny,:sunny]
  end
end
