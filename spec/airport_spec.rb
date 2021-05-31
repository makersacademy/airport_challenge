require 'airport'
require 'plane'

describe 'airport' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
    # user story 1
  it 'can instruct plane to land safely' do
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport).to respond_to(:land).with(1).arguments
  end
    # user story 2
  it 'can instruct a plane to take off safely' do
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport).to respond_to(:take_off).with(1).arguments
  end
    # user story 3
  describe '#land' do
    it 'raises an error if airport full' do  
      allow(airport).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times do
        current_plane = Plane.new
        airport.land(current_plane)
      end
      expect { airport.land(plane) }.to raise_error('Airport full')
    end   
  end
     # user story 4
  it 'allows for changes to airport capacity' do
    bigger_airport = Airport.new(50)
    allow(bigger_airport).to receive(:stormy?).and_return(false)
    50.times do 
      current_plane = Plane.new
      bigger_airport.land(current_plane)
    end
    expect { bigger_airport.land(plane) }.to raise_error('Airport full')
  end
    # user story 5 and 6
  it 'stops planes from landing when stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error('Stormy!')
    expect { airport.take_off(plane) }.to raise_error('Stormy!')
  end
    # Additional unit test 1
  it 'raises error if planes attempt to take off from incorrect airport' do
    airport2 = Airport.new
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport2).to receive(:stormy?).and_return(false)
    airport2.land(plane)
    expect { airport.take_off(plane) }.to raise_error('Wrong airport!')
  end
    # Additional unit test 2
  it 'does not let flying planes be at an airport' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.plane_no).not_to contain_exactly(plane)
  end
end
