require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }
    let(:weather) { Weather.new }
    
    describe 'plane landing' do
        it 'stores plane in hangar when landed' do
            airport.land(plane)
            puts "bum bum bum"
            puts airport.land(plane)
            expect(airport.hanger.length).to eq(1)
          end    
    end

    describe 'plane take off' do
        it 'plane can take off and confirm take off' do
            airport.take_off(plane)
            expect(plane.status_flying?).to eq(true)
            expect(airport.hanger).to be_empty
          end    
    end

  end

