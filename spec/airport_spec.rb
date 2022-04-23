require 'airport'

describe Airport do
  it 'responds to release_plane' do
    expect(subject).to respond_to(:release_plane)
  end
  it 'releases working planes' do
    plane = subject.release_plane
    expect(plane.working?).to be true
  end
  it 'responds to land_plane' do
    expect(subject).to respond_to(:land_plane)
  end
  it 'prevents landing when airport is full' do
    expect { subject.land_plane(Plane.new) }.to raise_error
  end
  it 'has a default capacity that can be overridden' do
    expect(subject.capacity).to eq 4
  end
  it 'prevents landing is weather is stormy' do
    expect { subject.land_plane(Plane.new) }.to raise_error
  end
  it 'prevents takeoff if weather is stormy' do
    expect { subject.release_plane(Plane.new) }.to raise_error
  end
end
