class Airport

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes_at_terminal = []
  end

  def land_plane(plane)
    raise "Airport is full" if airport_is_full?
    puts "landing #{plane}"
    @planes_at_terminal << plane
    puts "planes in terminal #{@planes_at_terminal}"
    :ok
  end

  def take_off(plane)
    puts "requesting #{plane} takes off"
    :ok
  end

  private 

  def current_plane_count
    @planes_at_terminal.size
  end

  def airport_is_full?
    current_plane_count == @capacity
  end
end
