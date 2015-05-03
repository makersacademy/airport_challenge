class Weather
  attr_accessor :stormy
  attr_accessor :sunny

  def initialize
    @stormy = stormy
    @sunny = sunny
  end

  def forecast
    num = rand(1..40)
    if num == 3
      (@stormy = true) && (@sunny = false)
    else
      (@stormy = false) && (@sunny = true)
    end
  end

  def sunny?
    @sunny
  end

  def stormy?
    @stormy
  end
end