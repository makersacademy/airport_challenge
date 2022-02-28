require 'plane'
require 'airport'

describe Plane do
  describe '.land' do
    it 'allows a plane to land at an airport' do
      airport_1 = Airport.new
      plane_1 = Plane.new
      allow(airport_1).to receive(:stormy?) { false }
      expect(plane_1.land(airport_1)).to eq [plane_1]
    end

    it "doesn't allow a plane to land if the airport is full" do
      airport_1 = Airport.new(2)
      plane_1 = Plane.new
      plane_2 = Plane.new
      plane_3 = Plane.new
      allow(airport_1).to receive(:stormy?) { false }
      expect {plane_1.land(airport_1)
              plane_2.land(airport_1) }.not_to raise_error
      expect {plane_3.land(airport_1)}.to raise_error "The airport is full"
    end

    it 'does not allow a plane to land when stormy' do
      plane_1 = Plane.new
      airport_1 = Airport.new
      allow(airport_1).to receive(:stormy?) { true }
      expect(plane_1.land(airport_1)).to eq "Could not land" 
    end

    it 'allows a plane to land when not stormy' do
      plane_1 = Plane.new
      airport_1 = Airport.new
      allow(airport_1).to receive(:stormy?) { false }
      expect(plane_1.land(airport_1)).not_to eq "Could not land" 
    end

    it "planes that are landed can not land again" do
      plane_1 = Plane.new
      airport_1 = Airport.new
      allow(airport_1).to receive(:stormy?) { false }
      plane_1.land(airport_1)
      expect { plane_1.land(airport_1) }.to raise_error "This plane has already landed"
    end

  end



  describe '.take_off' do
    it 'instructs a plane to take off from an airport and confirms it is no longer at the airport' do
      airport_1 = Airport.new
      plane_1 = Plane.new
      allow(airport_1).to receive(:stormy?) { false }
      plane_1.land(airport_1)
      expect(plane_1.take_off(airport_1)).to eq "Airborne"
      expect(airport_1.landed_planes).not_to include(plane_1)
    end

    it 'does not allow a plane to take off when stormy' do
      plane_1 = Plane.new
      airport_1 = Airport.new
      allow(airport_1).to receive(:stormy?) { false }
      plane_1.land(airport_1)
      allow(airport_1).to receive(:stormy?) { true }
      expect(plane_1.take_off(airport_1)).not_to eq "Airborne"
    end
    
    it 'allows a plane to take off when not stormy' do
      plane_1 = Plane.new
      airport_1 = Airport.new
      allow(airport_1).to receive(:stormy?) { false }
      plane_1.land(airport_1)
      expect(plane_1.take_off(airport_1)).to eq "Airborne" 
    end

    it "a plane can only take off from an airport it is in" do
      plane_1 = Plane.new
      airport_1 = Airport.new
      airport_2 = Airport.new
      allow(airport_1).to receive(:stormy?) { false }
      plane_1.land(airport_1)
      expect { plane_1.take_off(airport_2) }.to raise_error "That plane is not at that airport"
    end

    it "a plane can not take of if it is already flying" do
      plane_1 = Plane.new
      airport_1 = Airport.new
      allow(airport_1).to receive(:stormy?) { false }
      expect { plane_1.take_off(airport_1) }.to raise_error "A flying plane can not take off"
    end
  end



end