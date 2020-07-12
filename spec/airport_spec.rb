require 'airport'

describe Airport do
  # it { is_expected.to respond_to(:take_off).with(1).argument }
  # it 'confirms plane no longer in airport' do
  #  plane = Plane.new
  #  expect(subject.take_off(plane)).to eq "#{plane} has departed"
  # end
  #  it 'prevents a plane taking off in stormy weather' do
  #  p subject.weather.forecast('stormy')
  #  expect { subject.weather.forecast }.to raise_error 'stormy weather'

  # end
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it 'raises an error if the airport is full' do
      expect { 3.times { subject.land(Plane.new) } }.to raise_error 'airport full'
    end
    it 'raises an error if the plane is grounded' do
      expect { subject.land(Plane.new.land) }.to raise_error 'plane is grounded'
    end
  end
  describe '#take_off' do
    it 'raises an error if a plane is already flying' do
      expect { subject.take_off(Plane.new) }.to raise_error 'plane already airbourne'
    end
  end
  it { is_expected.to respond_to(:full?) }
  it 'initializes with a capacity given by the argument' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end
  it 'initializes with a default capacity when no argument given' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end
