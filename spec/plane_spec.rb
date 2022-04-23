require './docs/airport_challenge'

describe Plane do
  it 'creates instance of plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  it 'show that plane is no longer at airport' do
    plane = Plane.new
    plane.at_airport?
    expect(plane.at_airport?).to be false
  end
end
