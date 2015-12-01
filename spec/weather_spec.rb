require_relative '../lib/weather.rb'

describe Weather do

  it 'Weather object exists' do
    expect(subject).to be
  end

  xit 'Weather has weather report method' do
    expect(subject).to respond_to(:weather_report)
  end

  xit 'weather report method returns string' do
    expect(subject.weather_report().class).to be(String)
  end

  it 'weather report method can return stormy' do
     allow(subject).to receive(:weather_check).and_return("stormy")
     expect(subject.weather_check).to eq("stormy")
  end



end
