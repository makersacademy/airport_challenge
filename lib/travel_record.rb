module TravelRecord

  attr_reader :capacity

  DEFAULT_CAPACITY = 1

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @elements = []
  end

  def land element
    raise "#{self.class.name} full" if full?
    @elements << element
  end

  def take_off element
    @elements.pop
  end

  def empty?
    @elements.empty?
  end

  def full?
    @elements.count >= capacity
  end

end