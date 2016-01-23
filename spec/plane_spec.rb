require 'plane'

describe Plane do
  it {expect(subject).to be_a Plane}
  
  describe 'Plane should be able to land' do
    it {expect(subject).to respond_to(:land).with(1).argument}
    
    it 'lands at an airport' do
      airport = double(landed: 'Plane has touched down!!')
      expect(subject.land(airport)).to eq 'Plane has touched down!!'
    end
    
    it "can't land in stormy weather" do
      stormy_landing = double(landed: "It is too stormy to land now.")
      expect(subject.land(stormy_landing)).to eq 'It is too stormy to land now.'
    end
  end
  
  describe 'can take off from an airport' do
    let(:take_off) {double(leave_gate: 'Plane has taken off!!')}
    it {expect(subject).to respond_to(:take_off)}
    
    it 'leaves an airport' do
      expect(subject.take_off(take_off)).to eq 'Plane has taken off!!'
    end
    
    it "can't take off in stormy weather" do
      stormy = double(leave_gate: "It is too stormy to take off.")
      expect(subject.take_off(stormy)).to eq "It is too stormy to take off."
    end
  end
end