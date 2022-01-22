require './lib/airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:flying_plane) { Plane.new(in_flight = true) }

  # ==== HANGER TESTS ====

  it '#has a hanger' do
    expect(airport.hanger.class).to be Array
  end

  it '#is possible to check the hanger' do
    expect(airport).to respond_to(:check_hanger)
  end

  it '#is possible to modify the hanger size' do
    expect(airport).to respond_to(:modify_hanger)
  end

  it '#s hanger has a standard capacity of 40' do
    expect(airport.check_hanger).to eq 40
  end

  it '#can be made with different hanger size' do
    airport_big = Airport.new(80)

    expect(airport_big.check_hanger).to eq 80 
  end

  it '#s hanger size can be modified after initialization' do
    airport.modify_hanger(100)
    expect(airport.check_hanger).to eq 100
  end

  # ==== LANDING/TAKEOFF TESTS ====

  it '#landing planes can get to the hanger' do
    allow(airport).to receive(:rand).and_return(5)
    
    airport.land_plane(flying_plane)

    expect(airport.hanger).to eq([flying_plane])
  end

  it '#won\'t let planes land if the hanger is full' do
    small_airport = Airport.new(hanger_capacity = 3)

    allow(small_airport).to receive(:check_weather) { "sunny" }

    3.times{small_airport.land_plane(Plane.new(in_flight=true))}

    expect{small_airport.land_plane(flying_plane)}.to raise_error("Hanger is full")
  end

  it '#won\'t let a plane take off, if it isn\'t in the airport' do
    allow(airport).to receive(:rand).and_return(5)

    expect { airport.take_off(plane) }.to raise_error("#{plane} not in hanger")
  end

  it '#let\'s a plane take off if its in the hanger' do
    allow(airport).to receive(:rand).and_return(5)

    airport.hanger << plane

    expect(airport.take_off(plane)).to eq plane
  end

  it '#confirms plane has left the airport' do
    allow(airport).to receive(:rand).and_return(5)

    airport.hanger << plane

    airport.take_off(plane)

    expect(airport.contains_plane?(plane)).to eq("#{plane} departure confirmed")
  end

# ==== WEATHER TESTS ====

  it '#can check local weather' do
    expect(airport.check_weather.class).to be String
  end

  it '#returns stormy if the weather is stormy' do
    allow(airport).to receive(:check_weather) { "stormy" }

    expect(airport.check_weather).to eq "stormy"
  end

  it '#returns sunny if the weather is sunny' do
    allow(airport).to receive(:check_weather) { "sunny" }

    expect(airport.check_weather).to eq "sunny"
  end

  it '#won\'t allow planes to take off if weather is stormy' do
    airport.hanger << plane
    # srand(1)

    allow(airport).to receive(:rand).and_return(6)

    expect{airport.take_off(plane)}.to raise_error "There is a storm - no planes can take off or land"
  end

  it '#won\'t allow planes to land if weather is stormy' do
    allow(airport).to receive(:rand).and_return(6)
    # srand(1)

    expect{airport.land_plane(flying_plane)}.to raise_error "There is a storm - no planes can take off or land"
  end
end
