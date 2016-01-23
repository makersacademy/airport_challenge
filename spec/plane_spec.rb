require 'plane.rb'

describe Plane do
  let(:airport) { double :airport }

  describe '#clearance' do
    it 'returns planes clearance' do
      expect(subject.clearance).to eq false
    end
  end

  describe '#request_clearance' do
    it 'requests clearance from the airport and sets planes clearance to true' do
      allow(airport).to receive(:clearance?).and_return(true)
      subject.request_clearance(airport)
      expect(subject.clearance).to eq true
    end

    it 'resets clearance to false if clearance is currently true' do
      allow(airport).to receive(:clearance?).and_return(true)
      subject.request_clearance(airport)
      subject.request_clearance(airport)
      expect(subject.clearance).to eq false
    end
  end

end
