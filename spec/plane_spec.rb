require 'plane'
require 'airport'

describe Plane do

  # Airport instance
  airport = Airport.new("Heathrow")

  # Check methods exist
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:takeoff) }

  it 'land at airport' do
    expect(subject.land(airport)).to eq("Landed at Heathrow")
  end

  it 'take off from airport' do
    expect(subject.takeoff(airport)).to eq("Departed from Heathrow")
  end

end
