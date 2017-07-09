require 'airport'


describe Airport do
  it 'responds to land plane' do
    expect(subject).to respond_to :land_plane

  end

  it 'controller allowed to land plane' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it 'there is a plane that has landed at airport' do
    expect(subject).to respond_to :landed

  end

  it 'responds to takeoff plane' do
    expect(subject).to respond_to :takeoff
  end

  it 'controller allows landed plane to take off' do
    subject.landed(Plane.new)
    expect { subject.landed(Plane.new) }.to raise_error "plane has departed, no more planes."

  end

  it 'responds to no more plane at airport' do
    plane = Plane.new
    expect { subject.takeoff(plane) }.to raise_error "no more planes."

  end



end
