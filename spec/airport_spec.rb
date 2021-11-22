require 'airport'

describe Airport do
  # let variable do not set the anonymous subject or allow expectations to be called on it implicitly

  describe "#initialize" do
    it "can be initialized with a default capacity" do
      airport = Airport.new
      expect(airport).to be_an_instance_of(Airport)
      allow(airport).to receive_messages([])
      expect(airport.capacity).to eq 14
    end

    it "can be initialized with a custom capacity" do
      expect(Airport.new(11).capacity).to eq 11
    end
  end

  context "landing a plane"
    it { is_expected.to respond_to(:land).with(1).argument }

    it "raises an error when a plane tries to land but it is already at full capacity" do
      plane = double(:plane, landed: true, taken_off: false)
      #airport = instance_double(Airport, :full? => true, :in_hangar? => false, land: plane)
      #allow(airport).to receive_messages(plane)
      # populate that array @hangar
      airport = Airport.new
      Airport::CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end
    
    # it "raises an error when the weather is not safe for landing" do
    #   plane = double(:plane, landed: true, taken_off: false)
    #   airport = instance_double(Airport, :initialize, :safe? => false, :full? => false, :in_hangar? => false, land: plane)
    #   #allow(airport).to receive_messages(plane)
    #   # Weather.stub(:new) { stormy }
    #   expect { airport.land(plane) }.to raise_error 'Weather is stormy! do not land'
    # end

  context "plane taking off"
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "raises an error when a plane which isn't in the hangar tries to take off" do
      # plane = double(:plane, landed: true, taken_off: false)
      # airport = instance_double(Airport, :initialize, :full? => false, :in_hangar? => false, take_off: plane)
      # allow(airport).to receive_messages(plane)
      expect { subject.take_off(Plane.new) }.to raise_error 'this plane is not in this Airport'
    end

    # it "raises an error when the weather is not safe for take off" do
    #   plane = Plane.new
    #   #plane = double(:plane, landed: true, taken_off: false)
    #   airport = instance_double(Airport, :initialize, :safe? => false, :full? => false, :in_hangar? => true, take_off: plane)
    #   #allow(airport).to receive_messages(plane)
    #   # Weather.stub(:new) { stormy }
    #   expect { airport.take_off(plane) }.to raise_error 'Weather is stormy! do not take off'
    # end
end
