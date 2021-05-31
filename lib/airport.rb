class Airport 
  attr_accessor :full, :capacity, :planes
  
  DEFAULT = 50

  def initialize(capacity = DEFAULT)
    @capacity = capacity
    @planes = 0
  end

  def garage
    @planes += 1
  end

  def au_revoir
    @planes -= 1
  end

  def full
    @planes >= @capacity ? true : false
  end
end