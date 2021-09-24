class Weather
  attr_reader :stormy

  def initialize
    @stormy = stormy?
  end

  def stormy?
    if rand(2) == 1
      true
    else
      false
    end
  end
end
