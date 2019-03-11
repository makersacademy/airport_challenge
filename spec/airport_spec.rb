require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it "allows user to set a capacity" do
    expect(Airport.new(20).capacity).to eq 20
  end

  # default capacity is 25

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do
  # scenario 1: cannot land the plane because its already in the hangar
    it "cannot land if the plane is already in the hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.land(plane))== "Plane already in the hangar"
    end

  # scenario 2: the plane can only land if there is no storm :
    it "cannot land the plane if it is stormy" do
      plane = Plane.new
      if Weather.new.stormy? == true
        expect(subject.land(plane))== "There is a storm, cannot land"
      end
    end
  # scenario 3: the plan can land and can be added to hangar if there is no storm
    it "adds the plane to the hangar if it is not stormy" do
      plane = Plane.new
      if Weather.new.stormy? == false
        expect(subject.land(plane))== "Plane has landed"
      end
    end
  end

  describe "#take_off" do
  # scenario 1: there is no plane in hangar to take off:
    it "returns and error that there is no plane in hangar" do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.take_off(plane))== "Error: Plane is not in hangar"
    end

  # scenario 2: the plane will take off if it is not stormy:
    it "if there is no storm, the plane can take off" do
      plane = Plane.new
      subject.land(plane)
      unless Weather.new.stormy? == true
        expect(subject.take_off(plane)).to eq "Plane has taken off"
      end
    end
  end

end
