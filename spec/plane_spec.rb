require 'plane'

describe Plane do
  let(:airport) { double(:airport, full?: false) }
  let(:plane) { double(:plane, landing?: false, landed?: false, take_off?: false) }
  let(:weather) { double(:weather, stormy?: false)}

  describe "#landing" do
    it 'lands at an airport and confirm it has landed' do
      expect(plane.landing).to eq true
    end
  end
end