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
      expect(airport.capacity).to eq 50
    end
  end

###### Landing tests ######
  describe '#land' do
    it { is_expected.to respond_to(:land) }
  end

  describe '#successful_landing' do
    before do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
    end

    it 'should confirm landing' do
      allow(airport).to receive(:land) { "The plane has successfully landed" }
    end

    it 'contains plane that has landed' do
      expect(airport.planes).to include plane
    end

    it 'should NOT be in airborne_planes array' do
      expect(airport.airborne_planes).to_not include plane
    end
  end

  describe '#landing_permission' do
    it 'should prevent landing in stormy weather' do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error "Cannot land due to bad weather"
    end

    #TODO
    # Airport full if plane attempts to land

    it 'if airport full should not allow more to land' do
      airport = Airport.new(45)
      allow(airport).to receive(:stormy?) { false }
      45.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full...jog on"
    end
  end


###### Take off tests ######
  describe '#take_off' do
    it 'should prevent take_off if weather stormy' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.take_off(plane) }.to raise_error "Cannot take off due to bad weather"
    end
  end

  describe '#successful_take_off' do
    before do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      airport.take_off(plane)
    end

    it 'should confirm take off' do
      allow(airport).to receive(:take_off) { "Taken off successfully" }
    end

    it 'should add a plane to airborne_planes array' do
      expect(airport.airborne_planes).to include plane
    end

    it 'should NOT be in planes array' do
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
