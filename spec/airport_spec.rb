require 'airport'

describe Airport do

  describe '#planes' do
    it { is_expected.to respond_to :planes }
  end

  it '1. planes is an array' do
    expect(subject.planes).to be_a Array
  end

  describe '#land_plane' do

  it '2.1 puts a plane in the planes array' do
    allow(subject).to receive(:stormy?) {false}
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes.empty?).to be false
  end

  it '2.2 raises an error - CANNOT LAND IN A STORM' do
    allow(subject).to receive(:stormy?) {true}
    plane = Plane.new

    expect {subject.land_plane(plane)}.to raise_error "CANNOT LAND IN A STORM"
  end

  it '2.3 raises an error - CANNOT LAND AIRPORT IS FULL' do
    allow(subject).to receive(:stormy?) {true}
    plane = Plane.new

    expect {subject.land_plane(plane)}.to raise_error "CANNOT LAND IN A STORM"
  end



  end

  describe '#plane_take_off' do


    it '3.1 removes the plane from the planes array' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new

      subject.land_plane(plane)
      subject.plane_take_off(plane)
      expect(subject.planes.empty?).to be true

    end

    it '3.2 raises an error - CANNOT TAKE-OFF IN A STORM' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      subject.land_plane(plane)
      allow(subject).to receive(:stormy?) {true}

      expect {subject.plane_take_off(plane)}.to raise_error "CANNOT TAKE-OFF IN A STORM"
    end

  end





  #describe '#land_plane'
end
