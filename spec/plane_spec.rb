require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Plane do
subject(:plane) { described_class.new }

  it 'confirms it has landed' do
    expect(plane).to be_landed
  end

  it 'confirms it has taken off' do
    expect(plane).to be_taken_off
  end

end
