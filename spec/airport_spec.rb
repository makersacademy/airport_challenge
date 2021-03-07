require 'airport'
require 'plane'

describe Airport do
  subject { described_class.new }
  plane = Plane.new

  # class variable
  describe "#airports" do
    it "class variable airports should include subject" do
      expect(Airport.airports).to include(subject)
    end
  end

  # initialize
  describe "#initialize" do
    it "has default capacity" do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it "planes should be empty" do
      expect(subject.planes).to be_empty
    end
  end

  # plane land
  describe "#land" do
    before(:each) { subject.set_storm_probability(0) }
    it "respond to :land with 1 argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "add plane to planes list" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
      subject.take_off(plane)
    end

    it "set plane status to land" do
      subject.land(plane)
      expect(plane.status).to eq "land"
      subject.take_off(plane)
    end

    it "raises error when full" do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error "#{subject.name} is full"
    end

    it "raises error when plane already landed" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "#{plane.name} has already landed"
      subject.take_off(plane)
    end

    it "raises error when weather is stormy" do
      subject.set_storm_probability(1)
      expect { subject.land(plane) }.to raise_error "weather is stormy"
    end
  end

  # plane take off
  describe "#take_off" do
    before(:each) { subject.set_storm_probability(0) }
    before(:each) { subject.land(plane) }
    it "remove plane from planes list" do
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "set plane status to take off" do
      subject.take_off(plane)
      expect(plane.status).to eq "take off"
    end

    it "raises error when plane not in airport" do
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error "#{plane.name} not in airport"
    end

    it "raises error when weather is stormy" do
      subject.set_storm_probability(1)
      expect { subject.take_off(plane) }.to raise_error "weather is stormy"
    end
  end

  # Reset storm probability
  describe "#set_storm_probability" do
    it "raise error when set probability less than 0" do
      expect { subject.set_storm_probability(-1) }.to raise_error "only accept probability between 0-1"
    end

    it "raise error when set probability over 1" do
      expect { subject.set_storm_probability(1.1) }.to raise_error "only accept probability between 0-1"
    end
  end
end
