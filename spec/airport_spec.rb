require_relative '../lib/airport'

describe Airport do
# testing the Airport class
  describe '#land' do
    # testing for instruct_land method
    it 'should land plane into @landed_places' do # test landing 1 plane
      london = Airport.new
      plane = Plane.new
      expect(london.land(plane)).to eq(london.landed_planes)
    end

    it 'should land 2 planes into @landed_places' do # test landing 2 planes
      london = Airport.new
      plane1 = Plane.new
      plane2 = Plane.new
      london.land(plane1)
      expect(london.land(plane2)).to eq(london.landed_planes)
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

    it 'should return updated landed planes confirming takeoff' do # test the plane that took off is not landed
      london = Airport.new
      plane = Plane.new
      london.land(plane)
      expect(london.takeoff(plane)).to eq(london.landed_planes)
    end
  end

  describe '#weather' do
    # testing the weather method
    it 'should return a random number between 1 - 10 inclusive' do # test if the return is integer 1-10
      london = Airport.new
      expect(london.weather).to be_between(1, 10)
    end

    it 'raises exception too stormy to land' do # test if exception is raise if weather is too stormy to land
      london = Airport.new
      plane = Plane.new
      allow(london.land(plane)).to receive(:weather).and_return(9).and_raise('Too stormy to land')
    end
  end
end
