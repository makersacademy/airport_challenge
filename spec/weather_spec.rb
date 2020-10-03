require 'weather.rb'

describe Weather do

  it 'initializes with random number' do
    allow_any_instance_of(Weather).to receive(:rand).and_return(50)
    expect(subject.weather_no).to eq 50
  end
end
