require 'weather'

describe Weather do
  it 'has a public method called "stormy?"' do
    expect(subject).to respond_to :stormy?
  end

  it '"stormy?" is true when random_day is 0' do
    weather = Weather.new
    allow(weather).to receive(:random_day).and_return(0)
    expect(weather.stormy?).to eq true
  end
end
