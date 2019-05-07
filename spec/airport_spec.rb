require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double(:plane) }

  describe 'weather' do
    context 'when clear' do

      before(:each) do
        allow(subject).to receive(:weather_permit?).and_return(false)
      end

      it 'instructs a plane to land' do
        expect(subject).to respond_to(:land)
      end

      it 'checks landed plane is in airport' do
        subject.land(plane)
        expect(subject.planes).to include plane
      end

      it 'instructs a plane to take-off' do
        expect(subject).to respond_to(:take_off)
      end

      it 'checks taken-off plane has left airport' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include plane
      end

      it 'prevents landing if overcapacity' do
        capacity = 10
        capacity.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error 'Unable to land; airport full.'
      end

      it 'allows change of default capacity' do
        airport = Airport.new(5)
        allow(airport).to receive(:weather_permit?).and_return(false)
        5.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Unable to land; airport full.'
      end
    end

    context('stormy weather') do

      before(:each) do
        allow(subject).to receive(:weather_permit?).and_return(true)
      end

      it 'prevents take-off' do
        expect { subject.take_off(plane) }.to raise_error 'Unable to take-off; stormy weather.'
      end

      it 'prevents planes landing' do
        expect { subject.land(plane) }.to raise_error 'Unable to land; stormy weather.'
      end
    end
  end
end
