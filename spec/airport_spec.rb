require 'airport'

describe Airport do
planes = Plane.new

  describe '#land_plane' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land_plane).with(1).argument
      expect(subject.land_plane(planes)).to include planes
    end
    it 'fails if the airport is full' do
        Airport::DEFAULT_CAPACITY.times { subject.land_plane Plane.new }
        expect { subject.land_plane(planes) }.to raise_error 'airport is full'
    end
  end

  describe '#plane_depart'do

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:plane_depart)
      subject.land_plane(planes)
      expect(subject.plane_depart).to eq planes
    end
    it 'fails if the aiport is empty' do
      expect { subject.plane_depart }.to raise_error 'airport is empty'
    end
  end
end
