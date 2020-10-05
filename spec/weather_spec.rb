require 'weather'

describe Weather do

  it 'can create a new instance of weather' do
    expect(subject).to be_instance_of Weather
  end

  it 'can return the weather as sunny, when number is less than 80' do
    stub_const("Weather::WEATHER_NUM", 79)
    expect(subject.weather).to eq('sunny')
  end

  it 'can return the weather as stormy, when number is greater than 80' do
    stub_const("Weather::WEATHER_NUM", 82)
    expect(subject.weather).to eq('stormy')
  end

end

#   it 'can return the weather as stormy when the number is greater than 80' do
#     weather = Weather.new
#     allow(:weather).to receive(:number).and_return(81)
#     expect(weather.random_number).to eq 'stormy'
#   end
# end
