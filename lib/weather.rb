class Weather

  attr_reader :stormy

  def initialize(stormy = false)
    @stormy = stormy
  end

  def random
    rand(1..100)
  end

  def stormy?
    @stormy = (81..100).cover?(random)
  end

end
