require 'airport'

describe Airport do

  it "has no planes when it first opens" do
    expect(subject.planes).to be_empty
  end

  describe '#land' do
    it "can have a plane land at it" do
      plane = double(:plane)
      expect(subject.land(plane)).to include plane
    end
  end

  describe '#allow_takeoff' do
    it "lets a plane take off from the airport" do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.allow_takeoff(plane)).to eq plane
    end

    it "orders the correct plane to take off" do
      plane = double(:plane)
      another_plane = double(:another_plane)
      subject.land(plane)
      subject.land(another_plane)
      subject.allow_takeoff(plane)
      expect(subject.planes).to include another_plane
    end

    it "cannot order an absent plane to take off" do
      plane = double(:plane)
      expect { subject.allow_takeoff(plane) }.to raise_error "That plane does not exist"
    end

    it "should be able to expect a plane" do
      plane = double(:plane)
      subject.expect_plane(plane)
      expect(subject.plane_expected?(plane)).to be true
    end

    

  end







end
