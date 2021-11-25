# describe Airport do
#   it 'can respond to plane' do
#     airport = Airport.new
#     plane = Plane.new
#     expect(airport).to respond_to(:plane)
#   end

#   it 'should land a plane' do
#     airport = Airport.new
#     plane = Plane.new
#     expect(airport).to respond_to(:plane(land)) # .with(1).argument
#   end
# end
require 'airport'

describe Airport do
  subject(:airport) {described_class.new(5)}

  describe '#land(plane)' do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "can store the landed plane in the airport" do
      plane = Plane.new
      plane = airport.land(plane)
      expect(airport.land(plane)).to eq plane
    end

    it 'raises an error when the airport is at full capacity' do
      plane = Plane.new
      5.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
    end
  end

  it { is_expected.to respond_to(:take_off)} #.with(1).argument 

  it 'confirms plane is no longer at the airport' do
    plane = Plane.new
    expect(subject.take_off).to eq 'Plane has taken off'
  end  
  
  

end
