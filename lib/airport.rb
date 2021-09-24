class Airport

  CAPACITY = 20

  def initialize(weather_service, capacity = CAPACITY)
    @weather_service = weather_service
    @capacity = capacity
    @planes_at_terminal = []
  end

  def land_plane(plane)
    check_landing_conditions
    puts "landing #{plane}"
    @planes_at_terminal << plane
    puts "planes in terminal #{@planes_at_terminal}"
    :ok
  end

  def take_off(plane)
    raise "Plane cannot take-off due to bad weather" if weather_is_bad?
    puts "requesting #{plane} takes off"
    :ok
  end

  private 

  def check_landing_conditions
    raise "Airport is full" if airport_is_full?
    raise "Plane cannot land due to bad weather" if weather_is_bad?
  end

  def current_plane_count
    @planes_at_terminal.size
  end

  def airport_is_full?
    current_plane_count == @capacity
  end

  def weather_is_bad?
    @weather_service.weather_report == :storm
  end
end
