require 'airport'
require 'plane'
describe Airport do

  let (:airport) { Airport.new }
  let (:plane)   { Plane.new  }

  it 'should tell us the weather' do
    allow(airport).to receive(:weatherquality).and_return('good')
    expect(airport.weatherquality).to include('good')
  end

  describe '#land' do

    before do
      allow(airport).to receive(:weatherquality).and_return('good')
    end
    
    context 'when weather is good' do

      it 'should let a plane land' do
        airport.land(plane)
        expect(airport.terminal).to include(plane)
      end

      it 'can land the maximum capacity of planes' do
        3.times do
          airport.land(Plane.new)
        end
        expect(airport.terminal.length).to eq airport.capacity
      end

      context 'when capacity is full' do

        it 'raises an error if capacity is reached' do
          3.times do
            airport.land(Plane.new)
          end
          expect { airport.land(plane) }.to raise_error('Capacity is full')
        end
      end
    end

    context 'when weather is bad' do

      it 'should not let a plane land if weather is bad' do
        allow(airport).to receive(:weatherquality).and_return('bad')
        expect { airport.land(plane) }.to raise_error 'Weather is bad for landing'
      end
    end
  end

  describe '#takeoff' do

    context 'when weather is good' do

      it 'should let a plane take off' do
        allow(airport).to receive(:weatherquality).and_return('good')
        airport.land(plane)
        expect{airport.takeoff(plane)}.not_to raise_error
      end
    end

    context 'when weather is bad' do

      it 'should not let a plane take off' do
        allow(airport).to receive(:weatherquality).and_return('bad')
        expect { airport.takeoff(plane) }.to raise_error 'Weather is bad for taking off'
      end
    end
  end
end
