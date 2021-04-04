require 'airport'
describe Airport do

  it { is_expected. to be_an_instance_of(Airport) }

  describe '#initialize' do
    it 'will instantiate a hanger as an empty array' do
      expect(subject.hanger).to eq([])
    end

    it 'will create an instance variable with default capacity' do
      expect(subject.capacity).to eq(1)
    end

    it 'will create an instance variable with the capacity provided' do
      airport = Airport.new(2)
      expect(airport.capacity).to eq(2)
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'adds a plane to the hanger' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.hanger).to include(plane)
    end

    it 'raises an error if hanger is full' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'unable to land plane, hanger is full'
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'removes a plane from the hanger' do
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hanger).not_to include(plane)
    end

    it 'raises an error if hanger is empty' do
      allow(subject.weather).to receive(:stormy_weather?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error 'unable to take_off, no planes at hanger'
    end

    it 'raises an error if weather is stormy and we want to prevent take off' do
      allow(subject.weather).to receive(:stormy_weather?).and_return(true)
      plane = Plane.new
      subject.land(plane)
      expect { subject.take_off(plane) }.to raise_error 'unable to fly, weather is stormy'
    end

  end

  describe '#hanger_is_empty?' do
    it { is_expected.to respond_to(:hanger_is_empty?) }

    it 'returns a true value is there are no planes at the hanger' do
      expect(subject.hanger_is_empty?).to be true
    end
  end

  describe '#hanger_full?' do
    it { is_expected.to respond_to(:hanger_full?) }
    
    it 'should return true if airport is full' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.hanger_full?).to be true
    end
  end

  describe '#prevent_take_off?' do
    it { is_expected.to respond_to(:prevent_take_off?) }
  
    it 'tells us if the plane can take off' do
      allow(subject.weather).to receive(:stormy_weather?).and_return(true)
      expect(subject.prevent_take_off?).to be true
    end
  end
end
