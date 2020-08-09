require './docs/airport'
require './docs/plane'

describe Plane do

subject(:plane) { described_class.new }


it 'makes an instance of a plane' do
    expect(plane).to be_instance_of(Plane)
    end


it 'checks whether a plane left the airport after departure' do
    expect(plane).to respond_to(:departed?)
    end

end