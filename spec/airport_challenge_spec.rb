require_relative '../lib/airport_challenge.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'allows planes to land in sunny weather' do
    allow(plane).to receive(:weather_forecast).and_return(:sunny)
    expect(subject.land(plane)).to eq [plane]
  end

  it 'does not allow planes to land in stormy weather' do

  end

  it 'allows planes to take off from airport' do
    subject.land(plane)
    allow(plane).to receive(:weather_forecast).and_return(:sunny)
    expect(subject.take_off(plane)).to eq []
  end

  it 'prevents take off when weather is stormy' do
    allow(plane).to receive(:weather_forecast).and_return(:sunny)
    subject.land(plane)
    allow(plane).to receive(:weather_forecast).and_return(:stormy)
    plane.weather_forecast
    expect { subject.take_off(plane) }. to raise_error 'Weather warning. Cannot take-off.'
  end

  it 'keeps remaining planes at airport when plane leaves' do
    allow(plane).to receive(:weather_forecast).and_return(:sunny)
    allow(plane2).to receive(:weather_forecast).and_return(:sunny)
    subject.land(plane)
    subject.land(plane2)

    expect(subject.take_off(plane)).to eq [plane2]
  end

  it 'prevents planes from landing when airport is full' do
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Sorry we are full'
  end
end
