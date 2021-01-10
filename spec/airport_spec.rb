require "airport"

describe Airport do
  subject { Airport.new(@weather) }

  before(:each) do
    @weather = double("weather", :forecast => "sunny")
    @plane = double("plane", :docked => false, :docked= => nil)
  end

  describe "land" do
    it "checks if airport responds to land method" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "raises a fail if the airport is full" do
      Airport::STANDARD_CAPACITY.times { subject.land(@plane) }
      expect { subject.land(@plane) }.to raise_error "Airport is full"
    end

    it "lands a plane" do
      subject.land(@plane)
      expect(subject.planes.include?(@plane)).to eq true
    end

    it "sets plane to docked" do
      expect(@plane).to receive(:docked=).with(true)
      subject.land(@plane)
    end

    it "raises an error when trying to land a plane that has already landed" do
      allow(@plane).to receive(:docked).and_return(true)
      expect { subject.land(@plane) }.to raise_error "Already landed"
    end

    it "raises an arror when trying to land and weather is stormy" do
      allow(@weather).to receive(:forecast).and_return("stormy")
      expect { subject.land(@plane) }.to raise_error "Can't land while stormy"
    end

    it "allows multiple planes to land" do
      plane_2 = double("second plane", :docked => false, :docked= => nil)
      subject.land(@plane, plane_2)
      contains_planes_1 = subject.planes.include?(@plane)
      contains_planes_2 = subject.planes.include?(plane_2)
      expect(contains_planes_1 && contains_planes_2).to eq true
    end
      
  end

  describe "take off" do
    it "checks if airport responds to take off" do
      expect(subject).to respond_to(:take_off)
    end
    
    it "raises a fail if there are no planes docked" do
      expect { subject.take_off }.to raise_error "There are no planes to take off"
    end

    it "removes a plane" do
      subject.land(@plane)
      expect(subject.take_off).to eq @plane
      expect(subject.planes.include?(@plane)).to eq false
    end

    it "sets plane to be not docked" do
      subject.land(@plane)
      subject.take_off
      expect(@plane.docked).to eq false
    end

    it "raises an error if a plane tries to take off while stormy" do
      subject.land(@plane)
      allow(@weather).to receive(:forecast).and_return("stormy")
      expect { subject.take_off }.to raise_error "Can't take off while stormy"
    end

    it "allows for multiple planes to take off" do
      5.times { subject.land(@plane) }
      subject.take_off(5)
      expect(subject.planes.empty?).to eq true
    end

    it "raises an error if plane count is less than one" do
      expect { subject.take_off(0) }.to raise_error "Departure plane count must be greater than zero"
    end
  end

  describe "Initialization" do
    it "sets a default capacity" do
      expect(subject.capacity).to eq Airport::STANDARD_CAPACITY
    end
    
    it "sets variable capacity" do
      airport = Airport.new(@weather, 40)
      40.times { airport.land(@plane) }
      expect { airport.land(@plane) }.to raise_error "Airport is full"
    end
  end
end
