require './lib/plane_class.rb'
require './lib/airport_class.rb'
require './lib/weather_class.rb'

describe Plane do
  subject(:plane) { described_class.new }

  it 'can land' do
    airport = double(:airport, :here? => true)
    subject.land(airport)
    expect(subject.landed).to eq true
  end
  it 'can take off' do
    airport = double(:airport, :here? => true, :remove_from_roster => true)
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.landed).to eq false
  end
end
