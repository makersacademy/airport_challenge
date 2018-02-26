require_relative '../lib/airport'

describe Airport do
# testing the Airport class

  describe '#instruct_land' do
  # testing the instruct_land method
    it 'should set plane instruct to land' do
      # test that intruct_land method sets instruct to land
      airport = Airport.new
      plane = Plane.new
      expect(airport.instruct_land(plane)).to eq(plane.plane_status)
    end

    it 'should not allow instruct to land if plane is already landed' do
      # raises error if try to land the same plane twice
      airport = Airport.new
      plane = Plane.new
      plane.plane_status = ["landed"]
      airport.current_weather = 1
      expect { airport.instruct_land(plane) }.to raise_error('Plane already landed')
    end
  end

  describe '#instruct_takeoff' do
  # testing the takeoff method
    it 'should set plane instruct to takeoff' do
      # test that instruct_takeoff method sets instruct to takeoff
      airport = Airport.new
      plane = Plane.new
      plane.plane_status = ["landed", airport]
      expect(airport.instruct_takeoff(plane)).to eq("takeoff")
    end

    it 'should not allow plane to instruct takeoff if plane is already in flight' do
      # raises error if instruct to takeoff when plane is in flight
      airport = Airport.new
      plane = Plane.new
      airport.current_weather = 1
      expect { airport.instruct_takeoff(plane) }.to raise_error('Plane already in flight')
    end

    it 'should not allow plane to takeoff from an airport it is not in' do
      # raises error if plane takesoff from airport it is not at
      airport = Airport.new
      airport2 = Airport.new
      plane = Plane.new
      plane.plane_status = ["landed", airport]
      airport2.current_weather = 1
      expect { airport2.instruct_takeoff(plane) }.to raise_error('Plane is not in this airport')
    end
  end

  describe '#weather' do
  # testing the weather method
    it 'should return a random number between 1 - 10 inclusive' do
      # test if the return is integer 1-10 inlcusive
      london = Airport.new
      expect(london.weather).to be_between(1, 10)
    end

    it 'raises exception too stormy to land' do
      # test if exception is raise if weather is too stormy to land
      airport = Airport.new
      plane = Plane.new
      airport.instruct_land(plane)
      # setting current_weather to be too stormy to land
      # overiding random weather
      airport.current_weather = 9
      expect { plane.land(airport) }.to raise_error('Too stormy to land')
      # allow(london.land(plane)).to receive(:weather).and_return(9).and_raise('Too stormy to land')
      # Worked before putting in weather if statement
    end

    it 'raises exception too stormy to takeoff' do
      # test if exception is raise if weather is too stormy to takeoff
      airport = Airport.new
      plane = Plane.new
      plane.plane_status = ["landed", airport]
      # setting current_weather to be too stormy to takeoff
      # overiding random weather
      airport.instruct_takeoff(plane)
      airport.current_weather = 9
      expect { plane.takeoff(airport) }.to raise_error('Too stormy to takeoff')
      # allow(london.takeoff(plane)).to receive(:weather).and_return(9).and_raise('Too stormy to takeoff')
    end
  end
end
