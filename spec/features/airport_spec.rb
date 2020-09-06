# Unit test for Airport
require 'Airport'
describe Airport do
    # 'subject is the class described.new - instance of a class'
  subject(:airport) { described_class.new(10) } # US3 requires capacity for airports to meet condition 'full' 
    # 'is expected to respond_to method :land with one argument'
  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end
    # 'is expected to respond_to method take_off with one argument'
  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
    # 'plane is not allowed to land if airport meets condition full' 
  it 'plane not allowed to land if airport has full capacity' do
    # refactoring plane = double :plane -  double' allows you to test code 
    # even when it relies on a class that is undefined or unavailable
    plane = double :plane 
    10.times do 
      airport.land(plane) 
    end
    expect { airport.land(plane) }.to raise_error 'Airport full, no more planes allowed'
  end 

  
end
