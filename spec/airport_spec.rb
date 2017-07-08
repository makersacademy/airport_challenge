require 'airport'


describe Airport do
  it 'responds to land plane' do
    expect(subject).to respond_to :land_plane

  end

  it 'controller confirms plane has landed' do
    plane = Plane.new
    expect(subject.land_plane(plane))
  end


end
