require 'airport'
require 'weather'

describe Airport do

  describe 'land' do
    it 'does not let a plane land if the weather is bad' do
      (weather == storm) expect subject.land(plane).to raise_error "No planes can take off during a storm"
      end

    it 'allows a plane to land' do
      plane = Plane.new
      expect(subject).to respond_to :land
      subject.land(plane)
      expect(subject.planes.last).to eq plane
    end
  end

  describe 'take off' do
    it 'allows a plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end
  end

  it 'can have variable capacity' do
    airport_variable = Airport.new(15)
    expect(airport_variable.capacity).to eq 15
  end

end
