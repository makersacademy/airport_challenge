require 'weather'

describe Weather do

  it 'respondes to the method #weather_forcast' do
  expect(subject).to respond_to :weather_forcast
  end

end
