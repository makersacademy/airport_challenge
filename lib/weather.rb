

class Weather

  def initialize(stormy = random?(1, 4))
    @stormy = stormy
  end

  def stormy?
    @stormy
  end

  def random?(true_ratio, false_ratio)
    arr = Array.new(true_ratio, true).concat(Array.new(false_ratio, false))
    arr[rand(true_ratio + false_ratio)]
  end

  end
