require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:good_weather) { allow(airport).to receive(:bad_weather?).and_return(false) }
  let(:bad_weather) { allow(airport).to receive(:bad_weather?).and_return(true) }

  it 'responds to #takeoff' do
    expect(airport).to respond_to :takeoff
  end

  it 'plane takes off and is no longer at the airport' do
    good_weather
    easyjet = Plane.new
    airport.land(easyjet)
    airport.takeoff(easyjet)
    expect(easyjet.flying?).to eq true
  end

  it 'prevents #takeoff when weather is stormy' do
    bad_weather
    expect { airport.takeoff(Plane.new) }.to raise_error 'No departures due to adverse weather'
  end

  it 'responds to #land' do
    expect(airport).to respond_to :land
  end

  it '#land returns an instance of plane' do
    good_weather
    expect(airport.land(Plane.new)).to all(be_a(Plane))
  end

  it "Prevents landing when Airport is full" do
    good_weather
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error 'Airport is full'
  end

  it "Prevents landing when Airport is full with capacity = 100" do
    big_airport = Airport.new(100)
    allow(big_airport).to receive(:bad_weather?).and_return(false)
    100.times { big_airport.land(Plane.new) }
    expect { big_airport.land(Plane.new) }.to raise_error 'Airport is full'
  end

  it "Prevents landing when weather is stormy" do
    bad_weather
    expect { airport.land(Plane.new) }.to raise_error 'No arrivals due to adverse weather'
  end

  it "Prevents takeoff when plane is already in the air" do
    good_weather
    plane = Plane.new
    expect { airport.takeoff(plane) }.to raise_error 'Plane is already in the air'
  end

  it "Prevents takeoff when plane is already in the air" do
    good_weather
    plane = Plane.new
    expect { airport.takeoff(plane) }.to raise_error 'Plane is already in the air'
  end

  it "Prevents landing when plane is already on the ground" do
    good_weather
    plane = Plane.new
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error 'Plane must be flying to land'
  end

end
