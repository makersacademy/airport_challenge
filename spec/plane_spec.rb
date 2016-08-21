require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:weather) { double :weather}
  let(:airport) { double :airport}

  it {expect(plane).to respond_to(:status)}

  context "weather is fine for these examples" do
    before do
      allow(airport).to receive(:weather_check).and_return(nil)
      allow(airport).to receive(:land).and_return("landed")
    end
    it 'upon landing, changes plane status to landed' do
      plane.landed
      expect(plane.status).to eq "landed"
    end
  end
end
