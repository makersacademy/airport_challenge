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
  it "can't land unless flying" do
    subject.instance_variable_set(:@status, "landed")
    expect{subject.landing}.to raise_error "You're already on the ground, sir."
  end

  it "can't fly if already flying" do
    subject.instance_variable_set(:@status, "flying")
    expect{subject.taking_off}.to raise_error "You're already in the air, captain..."
  end

  it 'is flying when created' do
    expect(subject.status).to eq("flying")
  end

  it 'is landed after landing' do
    subject.landing
    expect(subject.status).to eq "landed"
  end

  it 'is flying after take off' do
    subject.landing
    subject.taking_off
    expect(subject.status).to eq "flying"
  end
end
