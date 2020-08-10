require './docs/airport'
require './docs/plane'

describe Airport do 

subject(:airport) { described_class.new }
    

 it 'makes an instance of the Airport' do
    expect(airport).to be_instance_of(Airport)
    end 
 
describe 'land' do

plane = Plane.new
it 'instruct a plane to land at the airport' do
    expect(airport).to respond_to(:land).with(1).argument
    end
end

describe 'take_off' do

it 'instruct a plane to take off from the airport' do
    expect(airport).to respond_to(:take_off).with(1).argument
    end
end

it 'raises an error when capacity of planes full' do
    
    airport.land(Plane.new)
    expect { subject.land Plane.new }.to raise_error 'Cannot land plane: airport is full'
    end

 describe 'planes' do

 it { is_expected.to respond_to(:planes) }
 
    end 

end 
