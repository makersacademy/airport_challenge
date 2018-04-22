require 'airport.rb'
require 'weather.rb'

describe Airport do



  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(24)
      weather = Weather.new
      allow(weather.stormy?).to receive(:outlook) { :sunny }
      24.times { airport.land Plane.new }
      expect { airport.land Plane.new }. to raise_error 'Airport is full'
    end
  end

  it 'returns a plane when taking off' do
    expect(subject).to respond_to :take_off
  end

  it 'lands a plane' do
    plane = Plane.new
    weather = double(:weather)
    allow(weather).to receive(:stormy?).and_return(false)
    expect(subject.land(plane)).to eq [plane]
  end

  it 'responds to plane method' do
    expect(subject).to respond_to :planes
  end

  it 'returns landed planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#take_off' do
    it 'a plane takes off' do
      plane = Plane.new
      weather = Weather.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when no plane has landed' do
      expect { subject.take_off }.to raise_error "No planes to take off"
    end


    it 'raises an error when weather is stormy' do
    plane = Plane.new
    subject = Airport.new
    expect { subject.take_off }.to raise_error "Too stormy to take off"
    end
  end


  describe '#land' do
    it 'raises an error when full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end
  end

end
