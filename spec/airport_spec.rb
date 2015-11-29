require 'airport'

describe Airport do
  it { is_expected.to respond_to(:tell_plane_to_land).with(1).argument }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'has a variable default capacity' do
    airport = Airport.new(50)
    50.times { airport.tell_plane_to_land(Plane.new) }
    expect{ airport.tell_plane_to_land(Plane.new) }.to raise_error 'Airport full'
  end

    it 'should land a plane' do
      plane = Plane.new
      subject.tell_plane_to_land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it 'should raise an error if a plane tries to land when it\'s stormy' do
      plane = Plane.new
      subject.storm
      expect{subject.tell_plane_to_land(plane)}.to raise_error "Plane can't land in a storm"
    end

    it 'should raise an error if the airport is full' do
      subject.clear
      Airport::DEFAULT_CAPACITY.times { subject.tell_plane_to_land(Plane.new) }
      expect { subject.tell_plane_to_land(Plane.new) }.to raise_error 'Airport full'
    end

    it { is_expected.to respond_to(:tell_plane_to_take_off).with(1).argument }

    it 'should let a plane take off' do
      plane = Plane.new
      subject.clear
      subject.tell_plane_to_land(plane)
      subject.tell_plane_to_take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'should raise an error if a plane tries to take off when it\'s stormy' do
      plane = Plane.new
      subject.tell_plane_to_land(plane)
      subject.storm
      expect{subject.tell_plane_to_take_off(plane)}.to raise_error "Plane can't take off in a storm"
    end

end
