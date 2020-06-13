require 'airport'
describe Airport do
  it 'should create an instance of an airport' do
    expect(Airport.new).to be_an_instance_of(Airport)
  end
  
  describe '#land' do
    it 'should land a plane' do
      expect(subject).to respond_to(:land).with(1).argument 
    end
  end
end
