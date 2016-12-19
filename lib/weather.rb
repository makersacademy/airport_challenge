class Weather
  attr_reader :stormy

  def initialize
    @stormy = is_stormy?
  end

  def is_stormy?
    values[random] == :stormy
  end

  def random
    rand(4)
  end

  def values
    [:stormy,:sunny,:sunny,:sunny]
  end
end
