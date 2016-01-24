class Weather

  attr_reader :stormy

  def initialize
    @stormy = false
  end

  def stormy?
    num = rand(1..200)
    if num/20 == 0
      @stormy = true
    else
      @stormy = false
    end
  end

end
