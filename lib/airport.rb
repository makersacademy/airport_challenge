class Airport
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def store(plane)
    storage << plane
  end

  def release(plane)
    storage.delete(plane)
  end
end
