require 'airport'

describe Airport do
  it { should respond_to :land }

  it 'is expected to take a plane as a parameter when trying to land planes' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end

end
