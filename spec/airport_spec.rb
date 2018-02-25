require_relative '../lib/airport'

describe Airport do
# testing the Airport class
  describe '#land' do
    # testing for instruct_land method
    it 'should land plane into @landed_planes' do # test landing 1 plane
      #london = object_double(Airport.new, :weather => 1)  # Trying to setup double
      london = Airport.new
      plane = Plane.new
      london.current_weather = 1
      # allow(london).to receive(:land.and_return(london.landed_planes << plane)
      expect(london.land(plane)).to eq(london.landed_planes)
    end

    it 'should not allow plane to land if airport is at full capacity' do
      london = Airport.new(0)
      plane = Plane.new
      london.current_weather = 1
      expect { london.land(plane) }.to raise_error('No capacity in airport')
    end

    it 'should not allow plane to land if plane is already landed' do
      london = Airport.new
      plane = Plane.new
      london.current_weather = 1
      london.land(plane)
      expect { london.land(plane) }.to raise_error('Plane already landed')
    end
  end

  describe '#takeoff' do
    # testing the takeoff method
    it 'should takeoff a plane' do # test single plane takeoff
      # london = double # Trying to setup double
      london = Airport.new
      plane = Plane.new
      london.current_weather = 1
      london.land(plane)
      london.current_weather = 1
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
      # setting current_weather to be too stormy to land
      # overiding random weather
      london.current_weather = 9
      expect { london.land(plane) }.to raise_error('Too stormy to land')
      # allow(london.land(plane)).to receive(:weather).and_return(9).and_raise('Too stormy to land')  # Worked before putting in weather if statement
    end

    it 'raises exception too stormy to takeoff' do # test if exception is raise if weather is too stormy to takeoff
      london = Airport.new
      plane = Plane.new
      # setting current_weather to be too stormy to takeoff
      # overiding random weather
      london.current_weather = 9
      expect { london.takeoff(plane) }.to raise_error('Too stormy to takeoff')
      # allow(london.takeoff(plane)).to receive(:weather).and_return(9).and_raise('Too stormy to takeoff')
    end
  end
end
