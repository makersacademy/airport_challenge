require 'airport'

describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it 'confirms plane no longer in airport' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq 'no longer in airport'
  end
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it 'raises an error if the airport is full' do
      expect { 3.times { subject.land(Plane.new) } }.to raise_error 'airport full'
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
