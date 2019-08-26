require 'weather'

describe Weather do

  it 'respondes to the method #weather_forcast' do
    expect(subject).to respond_to :weather_forcast
  end

  it 'returns stormy if the random_number = 2' do
    allow(subject).to receive(:weather_forcast) { 2 }
    expect(subject.weather_forcast).to eq 'stormy'
  end

end
