require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  it '#new ensures new planes are created in the air' do
    expect(subject).to be_an_instance_of(Plane)
    expect(subject.location).to eq(nil)
  end

  it '#land_plane lands the plane at the specified airport' do
    allow(airport).to receive(:accept_plane) {true}
    expect(plane.land(airport)).to eq "Plane landed at #{airport}."
  end
  
end