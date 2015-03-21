require 'airport'

describe Airport do
  context 'taking off and landing,' do
    context 'landing:' do
      let(:plane) { double :plane, land: 'landed' }
      it 'a plane can land' do
        expect(subject).to respond_to(:land)
      end

      it 'adds plane to plane list' do
        allow(subject).to receive(:bad_weather?).and_return(false)
        subject.land plane
        expect(subject.planes).to include(plane)
      end

      it 'sets plane status to landed' do
        allow(subject).to receive(:bad_weather?).and_return(false)
        expect(subject.land plane).to eq 'landed'
      end
    end
    context 'take off:' do
      let(:plane) { double :plane, take_off: 'flying', land: '' }
      it 'a plane can take off' do
        allow(subject).to receive(:bad_weather?).and_return(false)
        expect(subject).to respond_to(:take_off)
      end

      it 'sets plane status to flying' do
        allow(subject).to receive(:bad_weather?).and_return(false)
        subject.land plane
        expect(subject.take_off plane).to eq 'flying'
      end

      it 'removes plane from plane list' do
        allow(subject).to receive(:bad_weather?).and_return(false)
        subject.land plane
        subject.take_off plane
        expect(subject.planes).not_to include(plane)
      end

      it "doesn't allow planes that aren't there to take off" do
        expect { subject.take_off Plane.new }.to raise_error
      end
    end
  end

  context 'traffic control' do
    let(:plane) { double :plane, land: 'landed', take_off: 'flying' }
    it 'when airport is full a plane cannot land' do
      allow(subject).to receive(:bad_weather?).and_return(false)
      6.times { subject.land plane }
      expect { subject.land plane }.to raise_error
    end

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

  context 'Airport choice' do
    it 'can make an airport with worse weather' do
      airport = Airport.new(climate: 3)
      expect(airport.climate).to eq 3
    end
  end
end
