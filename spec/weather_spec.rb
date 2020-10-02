require 'Weather.rb'
describe Weather do
  it { is_expected.to respond_to :random_number }

  it { is_expected.to respond_to :weather_outcome }

  it 'weather_outcome method outputs correct weather' do
    weatheroutcome = Weather.new
    weatheroutcome.stub(:random_number) { 100 }
    expect(weatheroutcome.weather_outcome).to eq("Sunny")
  end


end
