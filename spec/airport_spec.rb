require 'airport'

describe Airport do

  let(:airport) { Airport.new }

  it 'responds to #takeoff' do
    expect(airport).to respond_to :takeoff
  end

  it 'plane takes off and is no longer at the airport' do
    easyjet = Plane.new
    allow(subject).to receive(:bad_weather?).and_return(false)
    subject.land(easyjet)
    subject.takeoff(easyjet)
    expect(easyjet.flying?).to eq true
  end

  it 'prevents #takeoff when weather is stormy' do
    allow(airport).to receive(:bad_weather?).and_return(true)
    expect { airport.takeoff(Plane.new) }.to raise_error 'No departures due to adverse weather'
  end

  it 'responds to #land' do
    expect(airport).to respond_to :land
  end

  it '#land returns an instance of plane' do
    allow(airport).to receive(:bad_weather?).and_return(false)
    expect(airport.land(Plane.new)).to all(be_a(Plane))
  end

  it "Prevents landing when Airport is full" do
    allow(airport).to receive(:bad_weather?).and_return(false)
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error 'Airport is full'
  end

  it "Prevents landing when Airport is full with capacity not equal to default" do
    big_airport = Airport.new(100)
    allow(big_airport).to receive(:bad_weather?).and_return(false)
    100.times { big_airport.land(Plane.new) }
    expect { big_airport.land(Plane.new) }.to raise_error 'Airport is full'
  end

  it "Prevents #landing when weather is stormy" do
    allow(airport).to receive(:bad_weather?).and_return(true)
    expect { airport.land(Plane.new) }.to raise_error 'No arrivals due to adverse weather'
  end

end
