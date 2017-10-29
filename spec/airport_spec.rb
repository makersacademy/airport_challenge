require 'Airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { :plane }

  it { is_expected.to respond_to(:land).with(1).argument }
  it 'has the plane once landed' do
    airport.land(plane)
    expect(airport.hangar).to include plane
  end

  it { is_expected.to respond_to(:take_off) }
  it "doesn't have the plane once taken off" do
    airport.land(plane)
    allow(airport).to receive(:weather_check).and_return false
    airport.take_off
    expect(airport.hangar).not_to include plane
  end

  it "should raise error if weather bad" do
    allow(airport).to receive(:weather_check).and_return true
    expect { airport.take_off }.to raise_error "Weather conditions are preventing take off"

  end
end
