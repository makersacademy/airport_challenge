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
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?


describe Plane do

  it "responds to flying" do
    expect(subject).to be_flying
  end

  it "responds to landed" do
    subject.land
    expect(subject).to be_landed
  end

  it "is flying when created" do
    instance = Plane.new
    expect(instance.status).to eq :flying  
  end 

  it "can land" do
    subject.land
    expect(subject).to be_landed
  end

  it "can take off" do
    subject.land
    subject.take_off
    expect(subject).to be_flying
  end

  it "changes status after landing" do
    instance = Plane.new
    instance.land
    expect(instance.status).to eq :landed
  end

  it "changes status after take_off" do
    instance = Plane.new
    instance.land
    instance.take_off
    expect(instance.status).to eq :flying
  end

end


