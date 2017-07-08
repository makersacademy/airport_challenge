require 'airport'


describe Airport do
  it 'responds to land plane' do
    expect(subject).to respond_to :land_plane

  end

  it 'controller allowed to land plane' do
    plane = Plane.new
    expect(subject.land_plane(plane))
  end

  it 'responds to plane landed' do
    expect(subject).to respond_to :landed

  end

  it 'responds to take off plane' do
    expect(subject).to respond_to :takeOff_plane
  end

  it 'controller allows landed plane to take off' do
    plane = Plane.new
    expect(subject.takeOff_plane(plane))

  end


end
