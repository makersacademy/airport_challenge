class Airport
  attr_reader :landed_planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def say_hey
    puts "hey"
  end

  def receive_plane(plane)
    if !full
      p "I'm not full"
      @landed_planes.push(plane)
      return true
    else
      return false
    end
  end

  def release_plane(plane, weather)
    if weather == "stormy"
      return false
    else
      @landed_planes - [plane]
      return true
    end
  end

  private

  def full
    puts "full method"
    puts @landed_planes.size
    puts @capacity
    @landed_planes.size >= @capacity
  end

end
