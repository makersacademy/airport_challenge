require 'plane'

describe Plane do
  let(:plane) { Plane.new("Boeing", 25_817) }

  it 'reports whether it is airborne' do
    plane.change_location("Sky")
    expect(plane.airborne?).to eq true
  end

  it 'reports make and serial number when requested' do
    expect(plane.registration).to include(
      :make => "Boeing",
      :serial => 25_817
    )
  end
end
