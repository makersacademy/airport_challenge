require 'airport'

describe Airport do

  describe '#land(plane)' do
    it 'should take in a plane when a plane is instructed to land' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#landed(plane)' do
    it 'should log that the plane is at the airport' do
      plane = Plane.new
      expect(subject.landed(plane)).to eq [plane]
    end
  end

  it 'should have an empty array of planes' do
    expect(subject.grounded_planes).to eq []
  end



  describe '#takeoff(plane)' do
    it 'should remove a plane from the airport' do
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq plane
    end
  end

  describe '#confirm_takeoff' do
    it 'should send a message confirming that the plane has left the airport' do
    end
  end
end
