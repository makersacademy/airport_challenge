class Weather

  attr_reader :stormy

  def initialize(stormy = false)
    @stormy = stormy
  end

  def random
    rand(100) +1
  end

  def stormy?
    @stormy = (81..100).include?(random)
  end

end
