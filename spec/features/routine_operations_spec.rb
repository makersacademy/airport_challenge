feature 'Routine operations' do
  before { @airport = make_airport }
  before { @planes = make_planes(@airport.capacity) }
  before { @landings, @takeoffs, @weather_rejects = 0, 0, 0 }

  scenario 'Lands and takes-off a number of planes' do
    100.times do
      plane = random_plane
      expect { give_order(plane, @airport) }.not_to raise_error
    end
    puts "Made #{@landings} landings and #{@takeoffs} take-offs. All good."
    puts "Received #{@weather_rejects} weather rejects."
  end

  private

  def make_airport
    Airport.new
  end

  def make_planes(n = 20)
    Array.new(n, Plane.new)
  end

  def random_plane
    @planes[rand(@planes.count - 1)]
  end

  def give_order(plane, airport)
    begin
      plane.landed_at?(airport) ? test_takeoff(plane, airport) : test_land(plane, airport)
    rescue StandardError => e
      raise e.message unless e.message.include?("weather conditions")
      @weather_rejects += 1
    end
  end

  def test_takeoff(plane, airport)
    plane.takeoff_from(airport)
    @takeoffs += 1
  end

  def test_land(plane, airport)
    plane.land_at(airport)
    @landings += 1
  end
end
