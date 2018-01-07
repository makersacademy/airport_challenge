require 'airport'

describe Airport do

  subject(:airport) { Airport.new }

  describe '#land' do
    it 'lands plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end

    it 'stores plane when it lands' do
      plane = Plane.new
      subject.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'stores more than one plane that lands' do
      plane = Plane.new
      plane2 = Plane.new
      subject.land(plane)
      subject.land(plane2)
      expect(airport.planes).to eq([plane, plane2])
    end

  end

  describe '#take_off' do
    it 'takes off plane' do
      plane = Plane.new
      subject.land(plane)
      expect(airport.take_off(plane)).to eq []
    end
  end

end
