require "Airport"

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context "Checking capacity argument works on Airport creation" do
    it "should accept a capacity argument and overide default capacity" do
      new_capacity = 50
      airport = Airport.new(new_capacity)
      expect(airport.capacity).to eq(new_capacity)
    end

    it "should raise an error when airport is full with new capacity" do
      new_capacity = 50
      airport = Airport.new(new_capacity)
      new_capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("Cannot land, airport full")
    end

    it "should have a default capacity when no argument is provided" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end

  describe '#land' do
    it "allows plane to land (add to array)" do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it "checks if the airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect(subject).to be_full
    end

    it "raises error when airport is full with DEFAULT_CAPACITY planes" do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error("Cannot land, airport full")
    end

    it "should confirm location after landing" do
      subject.land(plane)
      expect(plane).to be_landed
    end

    # it "raises error when weather is stormy" do
    #   expect { subject.land(plane) }.to raise_error("Weather too stormy to land")
    # end

    # it "raises error if already landed plane is called to land" do
    #   plane.landed?
    #   expect { subject.land(plane) }.to raise_error("This plane already landed")
    # end
  end

  describe '#take_off' do
    it "checks if the airport is empty" do
      expect(subject).to be_empty
    end

    it "allows plane to take off(remove from array)" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it "confirms plane location after take off" do
      subject.land(plane)
      subject.take_off(plane)
      expect(plane).to be_flying
    end

    it "raises error if no planes to take off" do
      expect { subject.take_off(plane) }.to raise_error("No planes available")
    end

    # it "raises error if unlanded plane is called to take off" do
    #   subject.take_off(plane)
    #   expect { subject.take_off(plane) }.to raise_error("This plane is not available")
    # end
  end
end
