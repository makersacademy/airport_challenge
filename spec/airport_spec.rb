require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it 'only allows a plane to land if there is space' do
    plane2 = Plane.new
    subject.land(plane)
    expect { subject.land(plane2) }.to raise_error "can't land, airport full"
  end

  it 'planes that are landed cannot land again' do
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error "plane already landed"
  end
end
