module PlaneHangar

  attr_writer :capacity

  DEFAULT_CAPACITY = 5

  def planes
    @planes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  private

  def hangar_full?
    planes.length >= capacity
  end

  def hangar_empty?
    planes.empty?
  end

end
