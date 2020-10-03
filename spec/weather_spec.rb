require 'weather.rb'

describe Weather do

  it 'initializes with random number' do
    allow_any_instance_of(Weather).to receive(:rand).and_return(50)
    expect(subject.weather_no).to eq 50
  end

  it 'sets weather to clear when rand between 11-89' do
    allow_any_instance_of(Weather).to receive(:rand).and_return(rand(11..89))
    expect(subject.weather).to eq 'clear'
  end

  it 'sets weather to stormy when rand <=10 or >=90' do
    allow_any_instance_of(Weather).to receive(:rand).and_return(rand(10))
    expect(subject.weather).to eq 'stormy'

    allow_any_instance_of(Weather).to receive(:rand).and_return(rand(90..100))
  end
end
