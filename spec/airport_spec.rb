require 'airport'
describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}
    describe '#land' do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands a plane' do 
    plane = Plane.new
    expect(airport.land(plane)).to eq([plane])
  end
context 'when full' do
  it 'raises an error' do
    2.times { airport.land(plane)}
    expect { airport.land(plane)}.to raise_error('Airport full:take of a plane to land this one') 
  end
  end
end
  describe '#take of' do
    
    it { is_expected.to respond_to(:take_of).with(1).argument }
    
    it 'takes-of a plane' do 
      @planes = []
      plane = Plane.new
      airport.land(plane)
      @planes << plane
      airport.take_of(plane)
      @planes.delete(plane)
      expect(@planes).not_to include(plane)
    end

    it 'confirms that plane is no longer at the airport' do
      @planes = []
      plane = Plane.new
      airport.land(plane)
      @planes << plane
      expect(airport.take_of(plane)).to eq(plane)
    end
  end
end   
  
    
       
         
    # off from an airport and confirm 
    # that it is no longer in the airport missing this on the take of part
