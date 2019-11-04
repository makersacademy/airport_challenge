require 'plane'

describe Plane do
  it 'creates an instance of Planes' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  it 'responds to land_at_airport' do
    plane = Plane.new
    expect(plane).to respond_to :land_at_airport
  end

  it 'responds to take_off' do
    plane = Plane.new
    expect(plane).to respond_to :take_off
  end

end
