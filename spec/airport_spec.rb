require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  context "change capacity" do
    override_capacity = 10
    subject { Airport.new(override_capacity) }
    it "can override the default capacity" do
      expect(subject.capacity).to eq override_capacity
    end
  end

  context "normal weather conditions" do
    before(:example) do
      Weather.any_instance.stub(:weather_conditions).and_return("sunny")
    end

    context "take off" do
      before(:example) do
        subject.land(plane)
        subject.takeoff(plane)
      end

      it "can have planes take off" do
        expect(subject.planes).not_to include(plane)
      end

      it "does not allow planes already in the sky to take off" do
        plane.grounded = false
        expect { subject.takeoff(plane) }.to raise_error("Plane already in the sky")
      end
    end
    

    context "is not full" do
      
      it "allows a plane to land if that plane is not already grounded" do  
        plane.grounded = false
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end

      it "does not allow a plane to land that is already grounded" do
        subject.land(plane)
        expect(subject.planes).not_to include(plane)
      end
    end

    context "is full" do
      subject { Airport.new(2) }
      it "does not accept planes" do
        subject.capacity.times { subject.land(Plane.new(false)) }
        expect { subject.land(plane) }.to raise_error("Airport is full")
      end
    end
  end

  context "weather is stormy" do

    before (:example) do
      Weather.any_instance.stub(:weather_conditions).and_return("stormy")
    end

    it "does not allow take off" do
      expect { subject.takeoff(plane) }.to raise_error "Weather is stormy. Takeoff not permitted."
    end

    it "does not allow planes to land" do
      expect { subject.land(plane) }.to raise_error "Weather is stormy. Landing not permitted."
    end
  end
end
