require 'weather'

describe Weather do

  it 'can create a new instance of weather' do
    expect(subject).to be_instance_of Weather
  end

  it 'can return the weather as sunny, when number is less than 80' do
    Weather.any_instance.stub(:number).and_return(25)
    weather = Weather.new
    weather.weather.should eq('sunny')
  end
end

#   it 'can return the weather as stormy when the number is greater than 80' do
#     weather = Weather.new
#     allow(:weather).to receive(:number).and_return(81)
#     expect(weather.random_number).to eq 'stormy'
#   end
# end
