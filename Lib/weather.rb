class Weather
  attr_accessor :stormy

  def initialize
  num = rand(7)
    if num > 2
      @stormy = true
    elsif num >= 2
      @stormy = false
    end
  end

  def stormy?
    @stormy
  end
end
