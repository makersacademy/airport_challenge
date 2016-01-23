require 'plane'

describe Plane do
  it {expect(subject).to be_a Plane}
  
  describe 'Plane should be able to land' do
    it {expect(subject).to respond_to(:land).with(1).argument}
    
    it 'lands at an airport' do
      airport = double(landed: 'Plane has touched down!!')
      expect(subject.land(airport)).to eq 'Plane has touched down!!'
    end
  end
  
  describe 'Plane can take off from an airport' do
    it {expect(subject).to respond_to(:take_off)}
    
    it 'leaves an airport' do
      airport = double(leave_gate: 'Plane has taken off!!')
      expect(subject.take_off(airport)).to eq 'Plane has taken off!!'
    end
  end
end