require 'airport'

describe Airport do

  context 'taking off and landing,' do
    context 'landing:' do
      let(:plane) { double :plane, land: 'landed' }
      it 'a plane can land' do
        expect(subject).to respond_to(:land)
      end

      it 'adds plane to plane list' do
        subject.land plane
        expect(subject.planes).to include(plane)
      end

      it 'sets plane status to landed' do
        expect(subject.land plane).to eq 'landed'
      end
    end
    context 'take off:' do
      let(:plane) { double :plane, take_off: 'flying', land: '' }
      it 'a plane can take off' do
        expect(subject).to respond_to(:take_off)
      end

      it 'sets plane status to flying' do
        expect(subject.take_off plane).to eq 'flying'
      end

      it 'removes plane from plane list' do
        subject.land plane
        subject.take_off plane
        expect(subject.planes).not_to include(plane)
      end
    end
  end

  context 'traffic control' do
    let(:plane) { double :plane, land: 'landed', take_off: 'flying' }
    it 'when airport is full a plane cannot land' do
      6.times { subject.land plane }
      expect { subject.land plane }.to raise_error
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context ', weather conditions, ' do
      it 'a plane cannot take off when there is a storm brewing' do
        allow(subject).to receive(:bad_weather?).and_return(true)
        expect { subject.take_off plane }.to raise_error # be more specific
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(subject).to receive(:bad_weather?).and_return(true)
        expect { subject.land plane }.to raise_error # be more specific
      end
    end
  end
end
