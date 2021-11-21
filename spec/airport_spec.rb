
require 'airport'

describe Airport do
  
  describe '#land(plane)' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when the airport is full' do
        plane = Plane.new
        airport = Airport.new
        subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  it { is_expected.to respond_to :take_off } 

  it 'instructs plane to take off and confirm it is no longer at the airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
    plane = Plane.new
    expect(subject.take_off(plane)).to eq 'Plane has taken off'
  end

  it 'it returns landed planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end 

end
