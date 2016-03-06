class Weather

  def initialize
  end

  def stormy?
    rand(1..4) % 4 == 0
  end
end
