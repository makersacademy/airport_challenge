require_relative '../lib/weather.rb'

describe Weather do

  it 'Weather object exists' do
    expect(subject).to be
  end

  it 'weather report method can return stormy' do
     allow(subject).to receive(:weather_check).and_return("stormy")
     expect(subject.weather_check).to eq("stormy")
  end



end
