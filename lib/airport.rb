class Airport
  attr_reader :storage

  def initialize
    @storage = []
  end

  def stormy?
    true
  end

  def land(plane)
    @storage << plane
  end

  def take_off(plane)
    fail RuntimeError, 'Too stormy' if stormy? == true
    @storage.delete(plane)
    @storage
  end
end
