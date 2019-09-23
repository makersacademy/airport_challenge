require 'weather'

describe Weather do
  it { is_expected.to respond_to :generate_weather }

  it 'generates random weather' do
    weather = Weather.new
    allow(weather).to receive(:generate_weather).and_return(false)

  end

  it 'generates random storms' do
    weather = Weather.new
    allow(weather).to receive(:generate_weather).and_return(true)
    # a stub... needs work
    expect(weather.generate_weather).to eq true
  end

end
