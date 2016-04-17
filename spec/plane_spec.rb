require 'plane'

describe Plane do
  let(:airport) { double(:airport, weather: "sunny", full?: false) }
  let(:another_airport) { double(:another_airport, weather: "sunny", full?: false) }
  let(:plane) {Plane.new(airport)}

  describe '#landed?' do
    context 'plane can confirm if it has landed or taken off' do
      it 'it confirms landed' do
        plane.land(airport)
        expect(plane.landed?).to eq true
      end
      it 'confirms that it has taken off' do
        plane.take_off(airport)
        expect(plane.landed?).to eq false
      end
    end
  end

  describe '#land' do
    context 'plane can land at an airport' do
      it 'lands' do
        expect(plane.land(airport)).to eq true
      end
      it 'does not land in stormy weather' do
        allow(airport).to receive(:weather).and_return("stormy")
        expect { plane.land(airport) }.to raise_exception "Can't land in stormy weather"
      end
      it 'does not land in a full airport' do
        allow(airport).to receive(:full?).and_return(true)
        expect { plane.land(airport) }.to raise_exception "Can't land in full airport"
      end
      it 'does not land again if already landed' do
        #allow(airport).to receive(:full?).and_return(true)
        plane.land(airport)
        expect { plane.land(airport) }.to raise_exception "Can't land again"
      end
    end
  end

  describe '#take_off' do
    context 'plane can take off from airport' do
      it 'it takes off' do
        expect(plane.take_off(airport)).to eq true
      end
      it 'does not take off in stormy weather' do
        allow(airport).to receive(:weather).and_return("stormy")
        expect { plane.take_off(airport) }.to raise_exception "Can't take off in stormy weather"
      end
      it 'can only take off from current airport' do
        plane.land(airport)
        expect(airport!=another_airport).to eq(true)
        expect { plane.take_off(another_airport) }.to raise_exception "Can't take off from another airport"
      end
    end
  end
end
