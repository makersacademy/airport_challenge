require 'airport'

describe Airport do
  let(:plane)   { Plane.new }
  let(:weather) { Weather.new }
  let(:airport) { subject }


  describe '#initialization' do

    it 'has sets default capacity as 30' do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:airborne?) { true }
      30.times { airport.land(plane) }
      message = "Airport full...jog on"
      expect { airport.land(plane) }.to raise_error message
    end

    it 'has a variable capacity' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end
  end

###### Landing tests ######
  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'raise error if not airborne' do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:airborne?) { false }
      message = "Error - Plane not airborne"
      expect { airport.land(plane) }.to raise_error { message }
    end
  end

  describe '#successful_landing' do
    before do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:airborne?) { true }
    end

    it 'should confirm landing' do
      expect(airport).to receive(:land)
      airport.land(plane)
    end

    it 'contains plane that has landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'should NOT be in airborne_planes array' do
      airport.land(plane)
      expect(airport.airborne_planes).to_not include plane
    end
  end

  describe '#landing_permission' do
    before do
      allow(plane).to receive(:airborne?) { true }
    end
    it 'should prevent landing in stormy weather' do
      allow(airport).to receive(:stormy?) { true }
      message = "Cannot land due to bad weather"
      expect { airport.land(plane) }.to raise_error message
    end

    it 'if airport full should not allow more to land' do
      airport = Airport.new(45)
      allow(airport).to receive(:stormy?) { false }
      45.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full...jog on"
    end
  end


###### Take off tests ######
  describe '#take_off' do
    before do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:airborne?) { true }
    end
    
    it 'should prevent take_off if weather stormy' do
      airport.land(plane)
      allow(plane).to receive(:airborne?) { false }
      allow(airport).to receive(:stormy?) { true }
      message = "Cannot take off due to bad weather"
      expect { airport.take_off(plane) }.to raise_error message
    end

    it 'raise error if if not landed' do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:airborne?) { true }
      message = "Error - Plane not at airport"
      expect { airport.take_off(plane) }.to raise_error { message }
    end
  end

  describe '#successful_take_off' do
    before do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:airborne?) { true }
      airport.land(plane)
    end

    it 'should confirm take off' do
      message = "Taken off successfully"
      allow(airport).to receive(:take_off) { message }
    end

    it 'should add a plane to airborne_planes array' do
      allow(plane).to receive(:airborne?) { false }
      airport.take_off(plane)
      expect(airport.airborne_planes).to include plane
    end

    it 'should NOT be in planes array' do
      allow(plane).to receive(:airborne?) { false }
      airport.take_off(plane)
      expect(airport.planes).to_not include plane
    end

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
