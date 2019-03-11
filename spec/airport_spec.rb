require 'airport'

describe Airport do 
  
  describe '#land' do
    context 'when the weather is good' do
      before :each do
        @airport = Airport.new(double(:weather, stormy?: false))
        @plane = double(:plane)
      end

      context 'when the plane is already at the airport' do
        before :each do
          @airport.land @plane
        end

        it 'raises an error' do
          expect { @airport.land @plane }.to raise_error "That plane is already on the ground!"
        end
      end

      context 'when the plane is not at the airport and the airport has spare space' do
        it 'prints a confirmation message' do
          expect { @airport.land @plane }.to output("☀️ Plane landed! ☀️\n").to_stdout
        end

        it 'returns the airport object' do
          expect(@airport.land @plane).to eq @airport
        end

        it 'stores the plane in the airport' do
          @airport.land @plane
          expect(@airport.include? @plane).to eq true
        end
      end

      context 'when the airport is initialised with default capacity' do
        before :each do
          @capacity = Airport::DEFAULT_CAPACITY
        end

        context 'when (default capacity - 1) planes are stored' do
          before :each do
            (@capacity - 1).times { @airport.land double(:plane) }
          end

          it 'allows a plane to land' do
            @airport.land @plane
            expect(@airport.include? @plane).to eq true
          end
        end

        context 'when (default capacity) planes are stored' do
          before :each do
            @capacity.times { @airport.land double(:plane) }
          end

          it 'raises an error' do
            expect { @airport.land @plane }.to raise_error "Airport full"
          end

          # would like to also check that the airport hasn't stored the plane, but don't know how to
          # run @airport.land @plane without causing the test to fail, since it errors....
        end
      end

      context 'when the airport is initialised with less than default capacity' do
        before :each do
          @capacity = Airport::DEFAULT_CAPACITY - 1 # maybe should add a test that DEFAULT_CAPACITY >= 1
          @airport = Airport.new(double(:weather, stormy?: false), @capacity)       
        end

        context 'when (custom capacity - 1) planes are stored' do
          before :each do
            (@capacity - 1).times { @airport.land double(:plane) }
          end

          it 'allows a plane to land' do
            @airport.land @plane
            expect(@airport.include? @plane).to eq true
          end
        end

        context 'when (custom capacity) planes are stored' do
          before :each do
            @capacity.times { @airport.land double(:plane) }
          end

          it 'raises an error' do
            expect { @airport.land @plane }.to raise_error "Airport full"
          end

          # would like to also check that the airport hasn't stored the plane, but don't know how to
          # run @airport.land @plane without causing the test to fail, since it errors....
        end
      end

      context 'when the airport is initialised with more than default capacity' do
        before :each do
          @capacity = Airport::DEFAULT_CAPACITY + 1
          @airport = Airport.new(double(:weather, stormy?: false), @capacity)       
        end

        context 'when (custom capacity - 1) planes are stored' do
          before :each do
            (@capacity - 1).times { @airport.land double(:plane) }
          end

          it 'allows a plane to land' do
            @airport.land @plane
            expect(@airport.include? @plane).to eq true
          end
        end

        context 'when (custom capacity) planes are stored' do
          before :each do
            @capacity.times { @airport.land double(:plane) }
          end

          it 'raises an error' do
            expect { @airport.land @plane }.to raise_error "Airport full"
          end

          # would like to also check that the airport hasn't stored the plane, but don't know how to
          # run @airport.land @plane without causing the test to fail, since it errors....
        end
      end
    end

    context 'when the weather is bad' do
      before :each do
        @weather = double(:weather)
        allow(@weather).to receive(:stormy?).and_return true 
        @airport = Airport.new(@weather)
      end

      context 'when the plane is already at the airport' do
        before :each do
          allow(@weather).to receive(:stormy?).and_return false 
          @airport.land @plane
          allow(@weather).to receive(:stormy?).and_return true
        end

        it 'raises an error' do
          expect { @airport.land @plane }.to raise_error "That plane is already on the ground!"
        end
      end

      context 'when the plane is not already at the airport' do
        it 'raises an error' do
          expect { @airport.land @plane }.to raise_error "⛈ Too dangerous to land. ⛈"
        end
      end
    end
  end
    
  describe '#clear_for_takeoff' do
    context 'when the weather is good' do
      before :each do
        @airport = Airport.new(double(:weather, stormy?: false))
        @plane = double(:plane)
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
          expect(@airport.include? @plane).to equal false
        end
      end

    end

    context 'when the weather is bad' do
      before :each do
        @weather = double(:weather)
        allow(@weather).to receive(:stormy?).and_return(true)        
        @airport = Airport.new(@weather)
        @plane = Plane.new
      end

      context 'when the plane is not at the airport' do
        it 'raises an error' do
          expect { @airport.clear_for_takeoff @plane }.to raise_error("That plane is not at that airport!")
        end
      end

      context 'when the plane is at the airport' do
        before :each do
          allow(@weather).to receive(:stormy?).and_return(false) # rewrite this without .receive, since we've already done that above?        
          @airport.land @plane
          allow(@weather).to receive(:stormy?).and_return(true) # rewrite this without .receive, since we've already done that above?
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
          expect(@airport.include? @plane).to eq true
        end
      end

    end

  end
end
