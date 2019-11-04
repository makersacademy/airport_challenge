require 'plane'

describe Plane do
<<<<<<< HEAD
  it 'creates an instance of Planes' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

=======
  it 'responds to land_at_airport' do
    expect(subject).to respond_to :land_at_airport
  end
>>>>>>> 14db827a3d0c2e8b0b7671ccdfa09a45bb8f80b2
end
