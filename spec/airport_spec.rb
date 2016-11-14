require 'airplane'
require 'airport'

describe Airport do
  subject(:airport) {Airport.new}
  let(:plane) {double("airplane", land: nil) }

  it 'has weather' do
    expect(airport.weather).to be_instance_of Weather
  end

  it "has capacity" do
    expect(airport.capacity).to eq 10
  end

  it 'can land a plane' do
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it 'changes state to landed when plane lands' do
    expect(plane).to receive(:land)
    airport.land(plane)

  end

  it 'can take off a plane' do
    airport.instance_variable_set(:@planes, [plane])
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end

  it "airport is full" do
    airport.capacity.times {airport.land(plane)}
    expect(airport.is_full?).to eq true
  end

  it "can't land planes when airport is full" do
    airport.capacity.times {airport.land(plane)}
    expect{airport.land(plane)}.to raise_error("airport is full")
  end
end
