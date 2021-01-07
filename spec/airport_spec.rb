require 'simplecov'
require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  
  it { is_expected.to respond_to(:land).with(1).argument }
  
  describe '#land' do
    
    it 'can land a plane' do
      
    end
  end
  
  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  describe '#take_off' do
    
    it 'allows a plane to take off from the airport' do
    
    end
  end
end