require 'airport'

describe Airport do
 let(:plane)   { Plane.new }
 let(:weather) { Weather.new }
 let(:airport) { subject }

  describe '#initialization' do

    it 'has sets default capacity as 30' do
      allow(airport).to receive(:stormy?) { false }
      30.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full...jog on"
    end

    it 'has a variable capacity' do
      airport = Airport.new(50)
      allow(airport).to receive(:stormy?) { false }
      50.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full...jog on"
    end

  end


  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'instructs a plane to land at a specific airport and confirm it has landed' do
      allow(airport).to receive(:stormy?) { false }
      expect(airport.land(plane)).to eq true
    end

    it 'contains plane that has landed' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'should prevent landing in stormy weather' do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error "Cannot land due to bad weather"
    end
  end


  describe '#update_land_status' do
    it 'should add a plane' do
      expect(airport.update_land_status(plane)).to eq [plane]
    end
  end


  describe '#take_off' do
    it 'should take_off' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to_not include(plane)
    end

    it 'should prevent take_off if weather stormy' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.take_off(plane) }.to raise_error "Cannot take off due to bad weather"
    end

    # it 'should only be able to take off from an airport it is in' do
    #   allow(airport).to receive(:stormy?) { false }
    #   airport.land(plane)
    #   airport2 = Airport.new
    #   allow(airport2).to receive(:stormy?) { false }
    #   expect { airport2.take_off(plane) }.to raise_error "Plane not in this airport"
    #
    # end
  end

end
