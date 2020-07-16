require 'airport.rb'
describe AirPort do
  it 'can create a new instance of an airport' do
    airport = AirPort.new
    expect(airport).to be_kind_of(AirPort)
  end
end
