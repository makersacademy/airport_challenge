require 'airport'

describe Airport do 
  
  before :each do
    @airport_good_weather = Airport.new(double(:weather, status: "☀️"))
    @airport_bad_weather = Airport.new(double(:weather, status: "⛈"))
    @plane = double(:plane)
  end

  # describe '.land' do

  #   # good weather behaviour
  #   it 'prints a confirmation message if the weather is good' do
  #     expect { @airport_good_weather.land @plane }.to output("☀️ Plane landed! ☀️\n").to_stdout
  #   end
  #   it 'returns the airport object if the weather is good' do
  #     expect(@airport_good_weather.land @plane).to eq @airport_good_weather
  #   end
  #   it 'stores the landed plane if the weather is good' do
  #     @airport_good_weather.land @plane
  #     expect(@airport_good_weather.planes).to include @plane
  #   end

  #   # bad weather behaviour
  #   it 'prints a confirmation message if the weather is bad' do
  #     expect { @airport_bad_weather.land @plane }
  #       .to output("⛈ Sorry, too dangerous to land. ⛈\n").to_stdout
  #   end
  #   it 'returns the airport object if the weather is bad' do
  #     expect(@airport_bad_weather.land @plane).to eq @airport_bad_weather
  #   end
  #   it 'does not store the landed plane if the weather is bad' do
  #     @airport_bad_weather.land @plane
  #     expect(@airport_bad_weather.planes).not_to include @plane
  #   end

  #   # default capacity behaviour
  #   it 'prints a message if the airport is full when using default capacity' do
  #     Airport::DEFAULT_CAPACITY.times { @airport_good_weather.land Plane.new }
  #     expect { @airport_good_weather.land @plane }.to output("Sorry, no more room!\n").to_stdout
  #   end
  #   it 'returns the airport object if the airport is full when using default capacity' do
  #     Airport::DEFAULT_CAPACITY.times { @airport_good_weather.land Plane.new }
  #     expect(@airport_good_weather.land @plane).to eq @airport_good_weather
  #   end
  #   it 'does not store the plane if the airport is full when using default capacity' do
  #     Airport::DEFAULT_CAPACITY.times { @airport_good_weather.land Plane.new }
  #     @airport_good_weather.land @plane
  #     expect(@airport_good_weather.planes).not_to include @plane
  #   end

  #   # default capacity - 1 behaviour
  #   it 'prints a message if the airport is one less than full when using default capacity' do
  #     (Airport::DEFAULT_CAPACITY - 1).times { @airport_good_weather.land Plane.new }
  #     expect { @airport_good_weather.land @plane }.to output("☀️ Plane landed! ☀️\n").to_stdout
  #   end
  #   it 'returns the airport object if the airport is one less than full when using default capacity' do
  #     (Airport::DEFAULT_CAPACITY - 1).times { @airport_good_weather.land Plane.new }
  #     expect(@airport_good_weather.land @plane).to eq @airport_good_weather
  #   end
  #   it 'does store the plane if the airport is one less than full when using default capacity' do
  #     (Airport::DEFAULT_CAPACITY - 1).times { @airport_good_weather.land Plane.new }
  #     @airport_good_weather.land @plane
  #     expect(@airport_good_weather.planes).to include @plane
  #   end
    
  #   # custom capacity behaviour
  #   it 'prints a message if the airport is full when using custom capacity' do
  #     airport = Airport.new(double(:weather, status: "☀️"), 3)
  #     3.times { airport.land Plane.new }
  #     expect { airport.land @plane }.to output("Sorry, no more room!\n").to_stdout
  #   end
  #   it 'returns the aiport object if the airport is full when using custom capacity' do
  #     airport = Airport.new(double(:weather, status: "☀️"), 3)
  #     3.times { airport.land Plane.new }
  #     expect(airport.land @plane).to eq airport
  #   end
  #   it 'does not store the plane if the airport is full when using custom capacity' do
  #     airport = Airport.new(double(:weather, status: "☀️"), 3)
  #     3.times { airport.land Plane.new }
  #     airport.land @plane
  #     expect(airport.planes).to_not include @plane
  #   end

  #   # custom capacity - 1 behaviour
  #   it 'prints a message if the airport is one less than full when using custom capacity' do
  #     airport = Airport.new(double(:weather, status: "☀️"), 3)
  #     2.times { airport.land Plane.new }
  #     expect { airport.land @plane }.to output("☀️ Plane landed! ☀️\n").to_stdout
  #   end
  #   it 'returns the aiport object if the airport is one less than full when using custom capacity' do
  #     airport = Airport.new(double(:weather, status: "☀️"), 3)
  #     2.times { airport.land Plane.new }
  #     expect(airport.land @plane).to eq airport
  #   end
  #   it 'does store the plane if the airport is one less than full when using custom capacity' do
  #     airport = Airport.new(double(:weather, status: "☀️"), 3)
  #     2.times { airport.land Plane.new }
  #     airport.land @plane
  #     expect(airport.planes).to include @plane
  #   end
    

  # end
  
  describe '#clear_for_takeoff' do

    context 'when the weather is good' do
      before :each do
        @airport = Airport.new(double(:weather, status: "☀️"))
        @plane = Plane.new
      end

      context 'when the plane is not at the airport' do
        it 'raises an error' do
          expect { @airport.clear_for_takeoff @plane }.to raise_error("That plane is not at that airport!")
        end
      end

      context 'when the plane is at the airport' do
        before :each do
          @airport.land @plane
        end

        it 'prints a confirmation message' do
          expect { @airport.clear_for_takeoff @plane }.to output("☀️ Up, up and away! ☀️\n").to_stdout
        end

        it 'returns the airport object' do
          expect(@airport.clear_for_takeoff @plane).to eq @airport
        end

        it 'removes the plane from the airport' do
          @airport.clear_for_takeoff @plane
          expect(@airport.planes).not_to include @plane
        end
      end

    end

    context 'when the weather is bad' do
      before :each do
        weather = double(:weather)
        allow(weather).to receive(:status).and_return("☀️", "⛈")        
        @airport = Airport.new(weather)
        @plane = Plane.new
      end

      context 'when the plane is not at the airport' do
        it 'raises an error' do
          expect { @airport.clear_for_takeoff @plane }.to raise_error("That plane is not at that airport!")
        end
      end

      context 'when the plane is at the airport' do
        before :each do
          @airport.land @plane
        end

        it 'prints an unconfirmation message' do
          expect { @airport.clear_for_takeoff(@plane) }
            .to output("⛈ Sorry, all aircraft grounded until further notice. ⛈\n").to_stdout
        end

        it 'returns the airport object' do
          expect(@airport.clear_for_takeoff @plane).to eq @airport
        end

        it 'leaves the plane in the airport' do
          @airport.clear_for_takeoff @plane
          expect(@airport.planes).to include @plane
        end
      end

    end

  end
end
