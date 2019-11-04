require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff) }

  it "expects that takeoff method returns plane object" do
    expect(subject.takeoff).to be_instance_of(Plane)
  end
end
