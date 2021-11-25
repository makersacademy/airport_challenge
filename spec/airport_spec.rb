require 'airport'

describe Airport do
  airport = Airport.new
  let(:plane) { double(Plane) }
  let(:plane2) { double(Plane) }
  
  context "basic instructions with good weather condition" do

    it { is_expected.to respond_to(:land).with(1).argument }

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "knows if a plane has taken off" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      expect(airport.in_hangar?(:plane)).to eq false
    end

    it "knows when a plan has landed" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      airport.land(:plane)
      expect(airport.in_hangar?(:plane)).to eq true
    end

    it "has a default capacity when created" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "can have a customized capacity when needed" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      expect(Airport.new(14).capacity).to be 14
    end
  end

  context "Edge cases" do
    it "can't instruct a plane to take off if the plane isn't in its hangar" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      airport.land(:plane1)
      expect { airport.take_off(:plane2) }.to raise_error "This plane is not in our hangar"
    end

    it "doesn't let a plan land if it is at full capacity" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      full_airport = Airport.new(2)
      full_airport.land(:plane1)
      full_airport.land(:plane2)
      expect { full_airport.land(Plane.new) }.to raise_error "This airport is full!"
    end

    it "raises an error if a plane that has already landed try to land again" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      airport.land(:plane2)
      expect { airport.land(:plane2) }.to raise_error "This plane has already landed"
    end
  end

  context "stormy weather" do
    it "raises an error if a plane tries to land in bad weather condition" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(false)
      expect { airport.land(:plane3) }.to raise_error "Weather is too stormy for landing!"
    end

     it "raises an error if a plane tries to take off in bad weather condition" do
      allow_any_instance_of(Airport).to receive(:safe?).and_return(true)
      airport.land(:plane4)
      allow_any_instance_of(Airport).to receive(:safe?).and_return(false)
      expect { airport.take_off(:plane4) }.to raise_error "Weather is too stormy for take off!"
    end
  end
end
