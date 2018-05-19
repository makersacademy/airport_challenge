require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it "allows a user to set a capacity" do
    expect(Airport.new(15).capacity).to eq 15
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do

    # it "returns a message saying plane has landed" do
    #   plane = Plane.new
    #   expect(subject.land(plane)).to eq "Plane has landed"
    # end

    # it "adds the plane to the hangar" do
    #   plane = Plane.new
    #   subject.land(plane)
    #   expect(subject.hangar).not_to be_empty
    # end
    #
    it "throws an error message if plane is already in hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.land(plane)).to eq "Error: Plane is already in hangar"
    end

    it "throws an error if try to land when airport is full" do
      # plane = Plane.new
      5.times { subject.land(Plane.new) }
      expect(subject.land(Plane.new)).to eq "Can't land: Airport full"
    end

  end

  describe "#take_off" do

    it "throws an error message if plane is not in hangar" do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq "Error: Plane is not in hangar"
    end

    # it "refuses to allow planes to take off if the weather is stormy" do
    #   plane = Plane.new
    #   subject.land(plane)
    #   unless Weather.new.stormy? == false
    #     expect(subject.take_off(plane)).to eq "Can't take off: weather stormy"
    #   end
    # end

  end

end
