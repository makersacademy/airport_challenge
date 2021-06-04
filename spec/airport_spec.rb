require 'airport'

describe Airport do
  it 'can land a plane at the airport' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'cannot land if plane is already in an airport' do
    plane = "plane one"
    expect { subject.land_plane(plane) }.to raise_error "Plane already in airport"
  end
  
end
