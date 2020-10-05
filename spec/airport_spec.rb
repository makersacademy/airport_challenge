require 'airport'

describe Airport do

  describe '#land(plane)' do
    it 'should take in a plane when a plane is instructed to land' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#land(plane)' do
    it 'should raise an error when trying to takeoff in stormy whether' do
      plane = Plane.new
      stub_const("Weather::WEATHER_NUM", 82)
      expect { subject.land(plane) }.to raise_error('you cannot land here, the weather is too bad')
    end
  end

  describe '#land(plane)' do
    it 'should log that the plane is at the airport' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.grounded_planes).to eq [plane]
    end
  end

  it 'should have an empty array of planes' do
    expect(subject.grounded_planes).to eq []
  end

  # describe '#takeoff(plane)' do
  #   it 'should remove a plane from the airport' do
  #     plane = Plane.new
  #     expect(subject.takeoff(plane)).to eq plane
  #   end
  # end

  describe '#confirm_takeoff' do
    it 'should return the grounded_planes less the plane that took off' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq []
    end
  end

  describe '#land(plane)' do
    it 'does not allow a plane to land if the airport is at capacity' do
      plane = Plane.new
      airport = Airport.new
      Airport::MAXIMUM_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error(RuntimeError, 'The airport is full, you cannot land here')
    end
  end
end
