require 'plane'

describe Plane do
  let(:leave) {double(leave_gate: 'Plane has taken off!!')}
  it {expect(subject).to be_a Plane}
  
  describe 'Plane should be able to land' do
    let(:landed) { double(landed: 'Plane has touched down!!') }
    
    it {expect(subject).to respond_to(:land).with(1).argument}
    
    it 'lands at an airport' do
      subject.take_off(leave)
      expect(subject.land(landed)).to eq 'Plane has touched down!!'
    end
    
    it "can't land in stormy weather" do
      stormy_landing = double(landed: "It is too stormy to land now.")
      subject.take_off(leave)
      expect(subject.land(stormy_landing)).to eq 'It is too stormy to land now.'
    end
    
    it 'can only land if in the air' do
      expect {subject.land(landed)}.to raise_error "Already on the ground"
    end
  end
  
  describe 'can take off from an airport' do
    it {expect(subject).to respond_to(:take_off)}
    
    it 'leaves an airport' do
      expect(subject.take_off(leave)).to eq 'Plane has taken off!!'
    end
    
    it "can't take off in stormy weather" do
      stormy = double(leave_gate: "It is too stormy to take off.")
      expect(subject.take_off(stormy)).to eq "It is too stormy to take off."
    end
    
    it 'can only take off if on the ground' do
      subject.take_off(leave)
      expect { subject.take_off(leave) }.to raise_error "Already in the air"
    end
  end
end