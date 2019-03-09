class Airport
  attr_accessor :name
  attr_accessor :log
  
  def initialize(name)
    @name = name
    @log = []
  end

  def log_plane(plane)
    @log << plane
  end

end
