require 'airport'
require 'air'
require 'plane'
require 'weather'
require 'air_control'

describe AirControl do

  it 'initializes with instance variable that has getter and setter methods' do
    central_control = described_class.new
    central_control.planes << { test: "testing" }
    expect(central_control.planes[0]).to have_key(:test)
  end

end
