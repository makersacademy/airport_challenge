class Airport

  attr_reader :planes

  def initialize
      @planes = []
  end

  def full?
    @planes.length >= 1
  end
end