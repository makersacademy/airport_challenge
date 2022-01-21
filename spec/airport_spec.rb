require './lib/airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

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
    # pending 'make hanger for planes'
    
    planeChanDesu = Plane.new(in_flight=true)

    airport.land_plane(planeChanDesu)

    expect(airport.hanger).to eq([planeChanDesu])
  end

  it '#won\'t let planes land if the hanger is full' do
    small_airport = Airport.new(3)

    3.times{small_airport.land_plane(Plane.new(in_flight=true))}

    expect{small_airport.land_plane(Plane.new(in_flight=true))}.to raise_error("Hanger is full")
  end

  it '#won\'t let a plane take off, if it isn\'t in the airport' do
    expect { airport.take_off(plane) }.to raise_error("#{plane} not in hanger")
  end

  it '#let\'s a plane take off if its in the hanger' do
    airport.hanger << plane

    expect(airport.take_off(plane)).to eq plane
  end

  it '#confirms plane has left the airport' do
    airport.hanger << plane

    airport.take_off(plane)

    expect(airport.contains_plane?(plane)).to eq("#{plane} departure confirmed")
  end

  # ==== WEATHER TESTS ====

  it '#can check local weather' do
    # pending 'make weather using PRNG - hash table?'
    expect(airport.weather.class).to be Integer
  end

  it '#returns stormy if the weather is stormy' do
    allow(airport).to receive(:change_weather).and_return(6)
    # airport.check_weather.stub(:rand) { 6 }

    expect(airport.check_weather).to eq "stormy"
  end

  it '#returns sunny if the weather is sunny' do
    pending 'nyi'
  end

end
