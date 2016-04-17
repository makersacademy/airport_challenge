require 'communicator'
require 'airport'
require 'plane'

shared_examples_for "a communicator" do
  let(:airport) { double(:airport, weather: "sunny", full?: false, planes: []) }
  let(:another_airport) { double(:another_airport, weather: "sunny", full?: false, planes: []) }
  let(:airport_planes) { double(:planes) }

  let(:flying_plane) { double(:plane, landed?: false, current_airport: nil, flying?: true) }
  let(:landed_plane) { double(:plane, landed?: true, is_flying: true, current_airport: airport, flying?: false) }
  let(:communicator) {described_class.new}


  describe '#land' do
    context 'planes can land at an airport' do
      it 'lands plane in current airport' do
        allow(flying_plane).to receive(:landed_at).with(airport).and_return(landed_plane)
        allow(airport).to receive(:dock).with(flying_plane).and_return([landed_plane])
        expect(communicator.land(flying_plane, airport)).to eq [landed_plane]
      end
      it 'does not land plane in stormy weather' do
        allow(airport).to receive(:weather).and_return("stormy")
        message = "Can't land in stormy weather"
        expect { communicator.land(flying_plane, airport) }.to raise_exception message
      end
      it 'does not land plane in a full airport' do
        message = "Can't land in full airport"
        allow(airport).to receive(:full?).and_return(true)
        expect { communicator.land(flying_plane, airport) }.to raise_exception message
      end
      it 'does not land plane again if already landed' do
        message = "Can't land again"
        expect {communicator.land(landed_plane, airport)}.to raise_exception message
      end
    end
  end

  describe '#take_off' do
    context 'planes can take off from airport' do
      it 'a plane takes off' do
        allow(airport).to receive(:undock).with(landed_plane).and_return([flying_plane])
        expect(communicator.take_off(landed_plane, airport)).to eq true
      end
      it 'makes sure plane is no longer in airport after take off' do
        expect(flying_plane.current_airport).to eq nil
      end
      it 'does not take off in stormy weather' do
        allow(airport).to receive(:weather).and_return("stormy")
        message = "Can't take off in stormy weather"
        expect { communicator.take_off(landed_plane, airport) }.to raise_exception message
      end
      it 'can only take off from current airport' do
        message = "Can't take off from another airport"
        allow(landed_plane).to receive(:current_airport).and_return another_airport
        expect { communicator.take_off(landed_plane, airport) }.to raise_exception
      end
      it 'plane can not take off if already flying' do
        message = "Can't take off when flying"
        expect { communicator.take_off(flying_plane, airport) }.to raise_exception message
      end
    end
  end
end

describe Plane do
  it_behaves_like "a communicator"
end

describe Airport do
  it_behaves_like "a communicator"
end
