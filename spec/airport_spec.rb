require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  
  it 'should create an instance of an airport' do
    expect(airport).to be_an_instance_of(Airport)
  end
  
  describe '#land' do
    it 'should land a plane' do
      expect(airport).to respond_to(:land).with(1).argument 
    end
  end
end
