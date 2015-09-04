require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  describe "#flying?" do

    context "when created" do
      it { is_expected.to respond_to :flying }

      it "is flying" do
        expect(subject.flying).to be_truthy
      end
    end
  end

  describe "#landing" do
    it { is_expected.to respond_to :landing }


    #create a new test that receives permission from airport - double/spike
    context "when permission to land is received from airport" do
      it "is not flying" do
        subject.landing
        expect(subject.flying).to be false
      end
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }

    #add double/spike now ?
    context "when permission received to take off" do
      it "is flying" do
        subject.landing
        subject.take_off
        expect(subject.flying).to be_truthy
      end
    end
  end
end
  # xit 'can land' ---- done
  #
  # xit 'is landed after landing' --- done
  #
  # xit 'can take off'
  #
  # xit 'is flying after take off'
