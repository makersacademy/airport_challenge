require 'airport'

describe Airport do

  airport = Airport.new
  plane = Plane.new
  weather = Weather.new

  describe 'allows plane to land'
  it {is_expected.to respond_to(:land?).with(1).argument}

  describe 'allow plan to take_off'
  it {is_expected.to respond_to(:take_off?).with(1).argument}

  it 'prevant plane from take_off if stormy' do
    allow(weather).to receive(:stormy)
    expect {airport.take_off?(plane)}.to raise_error("Cannot fly due to weather")
  end

  it 'prevant plane from land if stormy' do
    allow(weather).to receive(:stormy)
    expect {airport.land?(plane)}.to raise_error("Cannot land due to weather")
  end

  describe "capacity default set to 1"
  it {expect(subject.specified_capacity).to eq 1}

end
