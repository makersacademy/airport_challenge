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
            expect(airport.hanger).to include plane
          end    
    end

    describe 'plane take off' do

        before do
            allow(weather).to receive(:current_weather?).and_return false
        end

        it 'plane can take off and confirm take off' do
            airport.take_off(plane)
            expect(airport.hanger).to be_empty
          end    
    end

    describe 'plane weather conditions' do

        
        it 'can only take off in sunny weather' do
            # airport.take_off(plane)
            # expect(plane.status_flying?).to eq(false)
            expect { airport.take_off(plane) }.to raise_error('no flights in stormy weather')
          end    
    end
  end

