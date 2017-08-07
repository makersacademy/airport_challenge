require './lib/plane_class.rb'
require './lib/airport_class.rb'
require './lib/weather_class.rb'

describe Weather do
  subject(:weather) { described_class.new }
  it 'responds to stormy' do
    expect(weather).to respond_to(:stormy?)
  end
end
