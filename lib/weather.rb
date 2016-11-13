class Weather
  attr_reader :state

  def initialize
    @state = stormy
  end

  def stormy
    values[random] == :stormy
  end

  def random
    rand(4)
  end

  def values
    [:stormy,:sunny,:sunny,:sunny]
  end
end
