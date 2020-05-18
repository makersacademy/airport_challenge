require 'plane'

describe Plane do
  let(:airport) { double :airport }

  before(:each) do
    allow(airport).to receive_messages(request_take_off: nil, request_landing: nil)
  end

  describe '#initialize' do
    it 'sets location to "in_flight"' do
      expect(subject.location).to eq "in_flight"
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'sets location to airport it has landed in' do
      subject.land(airport)
      expect(subject.location).to eq airport
    end

    it 'raises an error when plane has already landed' do
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("Plane has already landed")
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'sets location to "in_flight"' do
      subject.land(airport)
      subject.take_off
      expect(subject.location).to eq "in_flight"
    end

    it 'raises an error when plane is already in flight' do
      expect { subject.take_off }.to raise_error("Plane is already in flight")
    end
  end
end
