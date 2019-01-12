require 'weather'

RSpec.describe Weather do

  it 'Stores forcasted weather in variable' do
    weather = Weather.new
    expect(weather.forecast).to be_a_kind_of(String)
  end
end
