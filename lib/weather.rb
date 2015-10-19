
module Weather

  attr_reader :stormy

  def initialize
    @stormy = false
  end

  def stormy?
    n = rand(10)
    @stormy = true if n > 7
    @stormy = false if n <= 7
    @stormy
  end

end
