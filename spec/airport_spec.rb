require 'airport'

describe Airport do

  it 'responds to planes' do
    expect(subject).to respond_to(:planes)
  end

  it 'responds to release_plane' do
    expect(subject).to respond_to(:release_plane)
  end

  describe '#release_plane' do
    it 'releases a plane' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.release_plane(plane)).to eq plane
    end
  end

  it 'responds to land_plane with one argument' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  describe '#land_plane' do
    it 'prevents landing when airport is full' do
      5.times { subject.land_plane Plane.new }
      expect { subject.land_plane Plane.new }.to raise_error 'airport full'
    end
  end

  it 'has a default capacity that can be overridden' do
    expect(subject.capacity).to eq 5
  end

  it 'lands something' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it 'returns landed planes' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to eq plane
  end

  it 'prevents landing if weather is stormy' do
    subject.weather = "stormy"
    expect { subject.land_plane(Plane.new) }.to raise_error 'weather too stormy for landing'
  end

  it 'prevents takeoff if weather is stormy' do
    subject.weather = "stormy"
    expect { subject.release_plane(Plane.new) }.to raise_error 'weather too stormy for take-off'
  end

end
