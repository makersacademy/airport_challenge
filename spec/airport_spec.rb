require 'airport'

describe Airport do

  it 'plane lands and is stored in the airport dock' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'plane takes off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it 'raises an error if the hanger is full' do
    Airport::DEFAULT_CAPACITY.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error "Hanger is full"
  end
  it 'land raises an error if stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land Plane.new }.to raise_error "Weather is stormy!"
  end

  it 'take off raises an error if stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off }.to raise_error "Weather is stormy!"
  end

  describe 'initialize' do 
    it 'allows capacity to be set by the user' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end
    it 'allows user to set capacity size' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
