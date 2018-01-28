require "Airport"


describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it "allows plane to land (add to array)" do
      expect(subject.land(plane)).to include plane
    end

    it "checks if the airport is empty" do
      expect(subject).to be_empty
    end

    it "checks if the airport is full" do
      subject.land(plane)
      expect(subject). to be_full
    end

    it "raises error when airport is full with DEFAULT_CAPACITY planes" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Cannot land, airport full")
    end

    # it "should confirm location after landing" do
    #   expect(subject.land(plane)).to be_landed
    # end
  end

  describe '#take_off' do
    it "allows plane to take off(remove from array)" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end
    #
    # it "confirms plane location after take off" do
    #   subject.land(plane)
    #   expect(subject.take_off(plane)).to eq("We have take off")
    # end

    it "raises error if no planes to take off" do
      expect { subject.take_off(plane) }.to raise_error("No planes available")
    end
  end

  it "should have a default capacity when no argument is provided" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

end
