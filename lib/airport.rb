class Airport
  attr_reader :planes, :name
  
  AIRPORT_CAPACITY = 10
  
  def initialize(name, plane)
    @name = name
    @planes = []
    2.times { @planes << plane.new }
  end
  
  def receive_plane(plane)
    @planes << plane
  end
  
  def release_plane(plane)
    @planes.delete plane
  end
  
  def ready_for_landing?
    check_weather == :sunny && !full?
  end
  
  def ready_for_taking_off?
    check_weather == :sunny
  end
  
  private
  
    def check_weather
      rand(1..10) > 8 ? :stormy : :sunny
    end
    
    def full?
      @planes.size == AIRPORT_CAPACITY 
    end
end
