require "plane"


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
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do
  let(:airport) {double(:airport, land_request: true)}

  it "is flying on creation" do
    expect(subject).to be_flying
  end

  it "can land" do
    expect(subject).to respond_to :land
  end

  it "is not landed if flying" do
    expect(subject).to_not be_landed
  end


  describe "#land" do

    it "is landed after landing" do
      subject.land
      expect(subject).to be_landed
    end

    it "does not allow landed planes to land" do
      subject.land
      expect{subject.land}.to raise_error "Plane is landed so cannot land"
    end
  end


   describe "#take_off" do

     it "is flying after take off" do
       subject.land
       subject.take_off
       expect(subject).to be_flying
     end

    it "does not allow flying planes to take off" do
      expect{subject.take_off}.to raise_error "Plane is flying so cannot take off"
    end
   end

end
  #   it "is flying after taking off" do
  #     subject.land(airport)              #change
  #     subject.take_off(airport)
  #     expect(subject).to be_flying
  #   end


  # xit "is flying when created"

  # xit "can land"

  # xit "is landed after landing"

  # xit "can take off"

  # xit "is flying after take off"


