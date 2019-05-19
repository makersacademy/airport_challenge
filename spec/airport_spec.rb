require 'airport'

describe 'airport' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'should respond to airport class' do
    expect(airport).to be_a_kind_of(Airport)
  end

  it 'should have a gettable variable landing_strip' do
    expect(airport.landing_strip).to eq([])
  end

  describe 'landing' do
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport

    it 'should respond to method land' do
      expect(airport).to respond_to(:land)
    end

    it 'should be able to land a plane' do
      plane.takes_off
      airport.land(plane)
      expect(airport.landing_strip).to include(plane)
    end

    it 'should change flying? to flase when landed' do
      plane.takes_off
      airport.land(plane)
      expect(plane.flying?).to eq(false)
    end

    context 'landing strip is full' do
      # As an air traffic controller
      # To ensure safety
      # I want to prevent landing when the airport is full

      it 'raises error when plane tries to land when landing_strip is full' do
        20.times { plane.takes_off
          airport.land(plane)
        }
        expect { airport.land(plane) }.to raise_error 'Cannot land as landing strip is full'
      end
    end

    context 'plane has already landed' do
      # Edge case - plane can't land if it isn't flying

      it 'raises error when plane tries to land when it isn\'t flying' do
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error 'This plane is not flying'
      end
    end

#     context 'weather is stormy' do
#       # As an air traffic controller
#       # To ensure safety
#       # I want to prevent landing when weather is stormy
#
# # ----------------- doubles aren't working as expected.
#       it 'raises error when plane tries to land when weather is stormy' do
#         weather = double(:weather)
#         allow(weather).to receive(:stormy?).and_return(true)
#         weather.stormy?
#         expect { airport.land(plane) }.to raise_error 'Cannot land as it is too stormy'
#       end
#     end
  end

  describe 'taking off' do
    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it 'should respond to method take_off' do
      expect(airport).to respond_to(:take_off)
    end

    it 'should be able to have a plane take_off' do
      plane.takes_off
      airport.land(plane)
      airport.take_off
      expect(airport.landing_strip).to eq([])
    end

    it 'should show plane as flying after take off' do
      plane.takes_off
      airport.land(plane)
      airport.take_off
      expect(plane.flying?).to eq(true)
    end

    context 'landing strip is empty' do
      it 'raises error if plane tries to take off when landing_strip is empty' do
        expect { airport.take_off }.to raise_error 'Cannot take off as there aren\'t any planes!'
      end
    end

#     context 'weather is stormy' do
#       # As an air traffic controller
#       # To ensure safety
#       # I want to prevent takeoff when weather is stormy
#
# # ----------------- doubles aren't working as expected.
#       it 'raises error if plane tries to take off when weather is stormy' do
#         # weather = double(:weather)
#         # allow(weather).to receive(:stormy?).and_return(true)
#         airport.land(plane)
#         # weather.stormy?
#         expect { airport.take_off }.to raise_error 'Cannot take off as it is too stormy'
#       end
#     end
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  describe 'capacity can be tested' do
    it 'raises error if airport is full' do
      airport.capacity.times { plane.takes_off
        airport.land(plane)
      }
      expect { airport.land(plane) }.to raise_error 'Cannot land as landing strip is full'
    end

    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { plane.takes_off
        airport.land(plane)
      }
      expect{ airport.land(plane) }.to raise_error 'Cannot land as landing strip is full'
    end
  end
end
