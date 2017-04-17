class Weather

  attr_accessor :stormy

  def initialize
    @stormy = stormy
  end

  def stormy
    return true if rand(3) == 1
    return false
  end

end
