class Airport

  def initialize
    @hangar = []
  end
  
  def store(plane)
    @hangar << plane
    "plane is stored"
  end

  def hangar_storage_report
    @hangar
  end
end