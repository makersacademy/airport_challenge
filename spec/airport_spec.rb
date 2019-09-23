require 'airport'
require 'weather'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }


  describe '#land_plane' do
    it 'raises error if plane is already on ground and tries to land again' do
      subject { Airport.new }
      plane = Plane.new
      subject.land_plane(plane)
      expect { subject.land_plane plane}.to raise_error(RuntimeError, 'Plane is already on the ground')
    end
  end

  describe '#take_off' do
    it 'plane can take off from airport' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq plane
    #  expect { subject.take_off}.to raise_error 'weather too bad to fly' if dangerous_weather? = true
    end
  end
end
