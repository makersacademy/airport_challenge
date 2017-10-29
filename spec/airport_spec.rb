require 'Airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { :plane }

  it { is_expected.to respond_to(:land).with(1).argument }
  it 'has the plane once landed' do
    allow(airport).to receive(:weather_check) { false }
    airport.land(plane)
    expect(airport.hangar).to include plane
  end

  it { is_expected.to respond_to(:take_off) }
  it "doesn't have the plane once taken off" do
    airport.land(plane)
    allow(airport).to receive(:weather_check) { false }
    airport.take_off
    expect(airport.hangar).not_to include plane
  end

  it "should raise error if trying to take off with bad weather" do
    allow(airport).to receive(:weather_check) { true }
    expect { airport.take_off }.to raise_error "Weather conditions are preventing take off"
  end

  it "should raise error if trying to land with bad weather" do
    allow(airport).to receive(:weather_check) { true }
    expect { airport.land(plane) }.to raise_error "Weather conditions are preventing landing"
  end
end
