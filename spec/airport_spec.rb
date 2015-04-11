require 'airport'

describe Airport do

  context 'taking off and landing' do
    let(:airport) { Airport.new }
    let(:plane) { double :plane }

    it 'can land a plane' do
      allow(plane).to receive :land!
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'changes status of plane to landed when landing a plane' do
      expect(plane).to receive(:land!)
      airport.land(plane)
    end

    it 'can take off a plane' do
      allow(plane).to receive :land!
      airport.land(plane)
      allow(plane).to receive :take_off
      airport.take_off(plane)
      expect(airport.planes).to be_empty
    end

    it 'changes status of plane to flying when taking off a plane' do
      allow(plane).to receive :land!
      airport.land plane
      allow(plane).to receive :take_off
      airport.take_off plane
    end
  end

  context 'traffic control' do

    xit 'a plane cannot land if the airport is full'

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
