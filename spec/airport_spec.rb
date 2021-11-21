
require 'airport'

describe Airport do
  
  describe '#land(plane)' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  it { is_expected.to respond_to :take_off } 

  it 'confirms plane is no longer at the airport' do
    plane = Plane.new
    expect(subject.take_off).to eq 'Plane has taken off'
  end  
  
  it 'raises an error when the airport is full' do
    plane = Plane.new
    airport = Airport.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error 'Airport is full'
  end

end
