require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  it '#new ensures new planes are created in the air' do
    expect(subject).to be_an_instance_of(Plane)
    expect(subject.location).to eq(nil)
  end

  it '#land_plane lands the plane at the specified airport if plane is accepted by airport' do
    allow(airport).to receive(:accept_plane) {true}
    expect(plane.land(airport)).to eq("Plane landed at #{airport}.")
    allow(airport).to receive(:accept_plane) {"Airport already at capacity"}
    expect(plane.land(airport)).to eq("Unable to land. Message from airport: Airport already at capacity")
  end
  
end