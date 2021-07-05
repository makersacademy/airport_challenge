require './lib/airport'

describe Airport do

  subject(:airport) { Airport.new }

  it 'responds to #land method' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane).join).to eq "#{plane}"
  end

  it 'plane takes off from the airport and confirms departure' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "#{plane} has departed the airport"
  end

  it "checks whether airport has space (contains < 3 planes)" do
    subject.capacity.times { subject.land(Plane.new) }
    expect(subject.space?).to eq false
  end

  it 'prevents landing if airport is full' do
    subject.capacity.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Cannot land, airport is full")
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'can override default capcity with a new capacity' do
    larger_airport = Airport.new(6)
    5.times { larger_airport.land(Plane.new) }
    expect { larger_airport.land(Plane.new) } .not_to raise_error
  end

  it 'responds to #weather? with either "stormy or "sunny"' do
    expect(subject.weather?).to eq("stormy").or eq("sunny")
  end
    

end
