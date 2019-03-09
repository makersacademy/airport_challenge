require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  describe "#land" do
    it "notifies that the plane has landed" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane has landed"
    end

    it "adds the plane to the hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).not_to be_empty
    end
  end

  describe "#take_off" do
  #scenario 1: there is no plane in hangar to take off:
    it "returns and error that there is no plane in hangar" do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq "Error: Plane is not in hangar"
    end
  # scenario 2: the plane will only take_off if it is not stormy:
    it "plane cannot take off if there is a storm" do
      plane = Plane.new
      subject.land(plane)
      unless Weather.new.stormy? == false
        expect(subject.take_off(plane)).to eq "There is a storm, can't take off"
      end
    end
  # scenario 3: the plane will take off if it is not stormy:
    it "if there is no storm, the plane can take off" do
      plane = Plane.new
      subject.land(plane)
      unless Weather.new.stormy? == true
        expect(subject.take_off(plane)).to eq "Plane has taken off"
      end
    end
  end
  
end
