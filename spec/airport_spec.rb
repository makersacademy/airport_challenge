require "airport"
require "plane"

describe Airport do
    it { is_expected.to respond_to :stormy? }
    
    it 'allows planes to land' do
        expect(subject).to respond_to :land
    end
 
    it 'allows planes to take off' do
        expect(subject).to respond_to :take_off
    end 
 
    it 'confirms plane has taken off' do
        plane = Plane.new
        subject.taken_off(plane)
        expect(subject.plane).to eq plane
    end

end  