require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  context 'taking off and landing' do

    before do
      allow(plane).to receive :land!
      allow(plane).to receive :take_off
      allow(airport).to receive(:weather).and_return "Sunny"
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

    before { allow(airport).to receive(:weather).and_return "Sunny" }

    it 'can have a capacity' do
      expect(airport.capacity).to eq 20
    end

    it 'a plane cannot land if the airport is full' do
      allow(plane).to receive :land!
      airport.capacity.times { airport.land plane }
      expect { airport.land plane }.to raise_error 'Airport is full, cannot land.'
    end

    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        allow(plane).to receive :land!
        allow(airport).to receive(:weather).and_return "Sunny"
        airport.land(plane)
        allow(airport).to receive(:weather).and_return "Stormy"
        expect { airport.take_off plane }.to raise_error 'You cannot take_off in a storm.'
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:weather).and_return "Stormy"
        expect { airport.land plane }.to raise_error 'You cannot land in a storm.'
      end
    end
  end
end
