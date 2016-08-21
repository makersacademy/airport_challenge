require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:weather) { double :weather}
  let(:airport) { double :airport}

  it {expect(plane).to respond_to(:status)}

  context "weather is fine for these examples" do
    before do
      allow(airport).to receive(:weather_check).and_return(nil)
    end
    it 'upon landing, changes plane status to landed' do
      airport.land(plane)
      expect(plane.status).to eq "landed"
    end
  end
end
