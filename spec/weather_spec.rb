require './lib/weather.rb'

describe Weather do
  let (:weather) { subject }

  it 'should generate a random weather condition' do
    weather = subject
    expect(Weather::CONDITIONS).to include weather.condition
  end

  # it 'should return true if conditions are stormy' do

end