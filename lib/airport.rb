class Airport
  # Airport must be initialized with a three-letter code symbol, e.g. LAX
  attr_reader :code

  def initialize(code)
    @stormy = false
    @code = code.upcase.to_sym
  end

  def stormy?
    generate_weather
    return stormy
  end

  private
  attr_reader :stormy

  def generate_weather
    # 1 in 20 chance of weather being stormy
    rand_num = rand(20)
    @stormy = (rand_num == 0)
  end
end
