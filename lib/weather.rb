class Weather

  attr_reader :stormy

  def initialize
    rand(1..2) == 1 ? @stormy = false : @stormy = true
  end

  def stormy?
    stormy
  end
end
