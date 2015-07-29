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
    expect(subject).to respond_to :flying?
  end

  it "responds to landed" do
    expect(subject).to respond_to :landed?
  end

  it "is flying when created" do
    expect(Plane.new.status).to eq :flying  
  end 

  it "can land" do
    expect(subject).to respond_to :land
  end

  it "can take off" do
    expect(subject).to respond_to :take_off
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


