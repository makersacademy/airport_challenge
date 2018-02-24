require_relative '../lib/airport'

describe Airport do
# testing the Airport class
  describe '#land' do
    # testing for instruct_land method
    it 'should land plane into @landed_places' do # test landing 1 plane
      london = Airport.new
      plane = Plane.new
      expect(london.land(plane)).to eq([plane])
    end

    it 'should land 2 planes into @landed_places' do # test landing 2 plane
      london = Airport.new
      plane1 = Plane.new
      plane2 = Plane.new
      london.land(plane1)
      expect(london.land(plane2)).to eq([plane1, plane2])
    end
  end

  describe '#takeoff' do
    # testing the takeoff method
    it 'should takeoff a plane' do # test single plane takeoff
      london = Airport.new
      plane = Plane.new
      london.land(plane)
      expect(london.takeoff(plane)).to eq([])
    end

    it 'should return empty airport' do # test there is no planes in airport after takeoff
      london = Airport.new
      plane = Plane.new
      london.land(plane)
      london.takeoff(plane)
      expect(london.landed_planes).to eq([])
    end
  end

  describe '#weather' do
    # testing the weather method
    it 'should return a random number between 1 - 10 inclusive' do # test if the return is
      london = Airport.new
      expect(london.weather).to be_between(1, 10)
    end
  end
end
