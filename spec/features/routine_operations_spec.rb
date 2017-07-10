feature 'Routine operations' do
  before { @airport = make_airport }
  before { @planes = make_planes(@airport.capacity) }
  before { @landings, @takeoffs, @weather_rejects = 0, 0, 0 }
  before { @plane = nil }

  scenario 'Lands and takes-off a number of planes' do
    rand(10..100).times do
      given_a_random_plane
      when_received_an_order_then_should_execute_successfully
    end
    print_test_stats
  end

  private

  def make_airport
    Airport.new
  end

  def make_planes(n = 20)
    Array.new(n, Plane.new)
  end

  def given_a_random_plane
    @plane = @planes.sample
  end

  def when_received_an_order_then_should_execute_successfully
    expect { give_order(@plane, @airport) }.not_to raise_error
  end

  def give_order(plane, airport)
    begin
      plane.landed_at?(airport) ? test_takeoff(plane, airport) : test_landing(plane, airport)
    rescue StandardError => error
      handle(error)
    end
  end

  def test_takeoff(plane, airport)
    plane.takeoff_from(airport)
    @takeoffs += 1
  end

  def test_landing(plane, airport)
    plane.land_at(airport)
    @landings += 1
  end

  def handle(error)
    raise error.message unless error.message.include?("weather conditions")
    @weather_rejects += 1
  end

  def print_test_stats
    puts "Made #{@landings} landings and #{@takeoffs} take-offs."
    puts "Received #{@weather_rejects} weather rejects."
  end
end
