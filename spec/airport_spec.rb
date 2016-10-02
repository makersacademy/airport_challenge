require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument}
    
    it 'lands a plane at the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to be plane
    end

    it 'lets a plane leave the airport' do
    plane = Plane.new
    expect(subject.take_off(plane)).to be plane
  end

end
