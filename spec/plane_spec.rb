require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes off from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

  describe "plane status flying or landed" do
    it "is flying when created" do
      expect(subject.status).to eq Plane::DEFAULT_STATUS
    end
  end

  describe "plane land method" do
    it "status is landed after landing" do
      subject.land
      expect(subject.status).to eq "landed"
    end
  end

  describe "plane fly method" do
    it "status is flying after being flown" do
      subject.fly
      expect(subject.fly).to eq "flying"
    end
  end

  describe "checks status of plane" do
    it "if plane land cannot be flying" do
      subject.land
      expect(subject).to_not be_flying
    end

    it "if plane fly cannot be landed" do
      expect(subject).to_not be_landed
    end

    it "if plane land should be landed" do
      subject.land
      expect(subject.landed?).to eq true
    end

    it "if plane fly should be flown" do
      expect(subject.flying?).to eq true
    end
  end

end
