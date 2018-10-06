require 'airport'

describe Airport do

  let(:plane) { double :plane, grounded?: false }
  let(:weather) { double :weather, stormy?: false }
  let(:stormy_weather) { double :stormy_weather, stormy?: true }

  describe '#arrival' do

    it 'accepts a plane and adds it to the ground_fleet' do
      airport = Airport.new(20, weather)
      allow(plane).to receive(:land).and_return(plane)
      airport.arrive(plane)
      expect(airport.ground_fleet).to eq [plane]
    end

    it 'raises an error when at capacity' do
      airport = Airport.new(20, weather)
      allow(plane).to receive(:land).and_return(plane)
      airport.capacity.times { airport.arrive(plane) }
      expect { airport.arrive(plane) }.to raise_error('The ground fleet is at capacity')
    end

    it 'should not allow arrivals when stormy weather' do
      airport = Airport.new(20, stormy_weather)
      expect { airport.arrive(plane) }.to raise_error('The weather is too stormy to land')
    end

  end

  describe '#departure' do

    it 'lets a plane takeoff and removes from ground fleet' do
      airport = Airport.new(20, weather)
      allow(plane).to receive(:takeoff).and_return(plane)
      airport.ground_fleet << plane
      expect(airport.depart).to eq plane
    end

    it 'raises an error if no planes in ground fleet' do
      expect { subject.depart }.to raise_error('No planes available in ground fleet')
    end

  end

  describe '#full?' do
    it 'should be true when ground_fleet at capacity' do
      airport = Airport.new(20, weather)
      allow(plane).to receive(:land).and_return(plane)
      airport.capacity.times { airport.arrive(plane) }
      expect(airport).to be_full
    end
  end

  describe '#empty?' do
    it 'should be true when ground fleet empty' do
      expect(subject).to be_empty
    end
  end

end
