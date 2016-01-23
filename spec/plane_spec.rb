require 'plane.rb'

describe Plane do
  let(:airport) { double :airport }

  describe 'clearance' do
    it 'returns planes clearance' do
      expect(subject.clearance).to eq false
    end
  end

  describe '#request_clearance' do
    it 'requests clearance from the airport and sets it to true' do
      airport = Airport.new
      expect(subject.request_clearance(airport)).to eq true
    end

    it 'sets the planes #clearance to true if airport returns true' do
      airport = Airport.new
      subject.request_clearance(airport)
      expect(subject.clearance).to eq true
    end
  end

end
