require './lib/airport'
require './lib/plane'

describe Airport do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }
    
    describe 'plane landing' do
        it 'stores plane in hangar when landed' do
            airport.land(plane)
            expect(airport.hangar.length).to eq(1)
          end    
    end

  end

