class Airport

  attr_reader :name
  attr_accessor :parked

  def initialize(name)
    @name = name
    @parked = 0
  end

  def full?
    @parked.positive?
  end

end
