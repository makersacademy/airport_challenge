class Airport

  def initialize(hangar_capacity=10)
    @hangar = []
    @hangar_capacity = hangar_capacity
  end
  
  def store(plane)
    @hangar << plane
    "#{plane} is stored"
  end

  def release(plane)
    @hangar -= [plane]
    "#{plane} is released"
  end

  def hangar_storage_report
    @hangar
  end

  def hangar_plane_count
    @hangar.length
  end

  def hangar_at_capacity?
    hangar_plane_count >= @hangar_capacity
  end

  def plane_stored?(plane)
    @hangar.include?(plane)
  end
end