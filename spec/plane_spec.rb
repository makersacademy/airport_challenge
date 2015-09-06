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

  it { is_expected.to respond_to :flying }

  it "has a flying status when created" do
    expect(subject.flying).to eq(true)
  end

  it "can land" do
    is_expected.to respond_to(:landed)
  end

  it "has landed" do
    subject.landed
    expect(subject.flying).to eq(false)
  end

  it "can take off" do
    is_expected.to respond_to(:taken_off)
  end

  it "is flying after take off" do
    subject.landed
    subject.taken_off
    expect(subject.flying).to eq(true)
  end

end
