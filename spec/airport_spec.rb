require 'Airport'

describe Airport do
    it 'responds to land' do
      expect(subject).to respond_to(:land)
    end

    it 'responds to take off' do
      expect(subject).to respond_to(:takeoff)
    end

    it 'when a plane lands a new instance of plane is created at airport' do
      airport =Airport.new
      plane = Plane.new
      expect(airport.land).to eq plane
    end
end
