require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  context 'taking off and landing' do

    before do
      allow(plane).to receive :land!
      allow(plane).to receive :take_off
    end

    it 'can land a plane' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'changes status of plane to landed when landing a plane' do
      expect(plane).to receive(:land!)
      airport.land(plane)
    end

    it 'can take off a plane' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to be_empty
    end

    it 'changes status of plane to flying when taking off a plane' do
      airport.land plane
      expect(plane).to receive :take_off
      airport.take_off plane
    end
  end

  context 'traffic control' do

    it 'can have a capacity' do
      expect(airport.capacity).to eq 20
    end

    it 'a plane cannot land if the airport is full' do
      allow(plane).to receive :land!
      airport.capacity.times { airport.land plane }
      expect { airport.land(plane) }.to raise_error 'Airport is full, cannot land.'
    end

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
