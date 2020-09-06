# Unit test for Airport
require 'Airport'
describe Airport do
    # 'subject is the class described.new - instance of a class'
  subject(:airport) { described_class.new(10) } # US3 requires capacity for airports to meet condition 'full' 
  let(:plane) { double :plane } # 'let' statement to  make variable accessible across different classes 
  
  describe '#land' do # cannonical way of writing methods (the #land hash is to indicate instance method)
    # 'is expected to respond_to method :land with one argument'
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end
      
    context 'when full' do
    # 'plane is not allowed to land if airport meets condition full' 
      it 'raises error' do
    # refactoring plane = double :plane -  double' allows you to test code 
    # even when it relies on a class that is undefined or unavailable
    # plane = double :plane *see let(:plane) { double :plane } -> not a good idea to declare 
    # variable inside a test
        10.times do 
          airport.land(plane) 
        end
        expect { airport.land(plane) }.to raise_error 'Airport full, no more planes allowed'
      end 
    end
  end

  describe '#take_off' do
    # 'is expected to respond_to method take_off with one argument'
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end 
end
