require 'airport'

describe Airport do
  it 'can land a plane at the airport' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'cannot land if plane is already in an airport' do
    plane = "plane one"
    expect { subject.land_plane(plane) }.to raise_error "Plane already in airport"
  end

  describe '#take_off' do
    it 'can instruct a plane to take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'can not take_off because plane not in airport' do
      plane = "plane one"
      expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
    end
  end
  
end
