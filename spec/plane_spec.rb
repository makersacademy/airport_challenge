require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:leave) {double(leave_gate: 'Plane has taken off!!')}
  let(:landed) {double(landed: "Plane has touched down!!")}
  
  it {expect(plane).to be_a Plane}
  
  describe 'Plane should be able to land' do
    
    it 'lands at an airport' do
      expect(plane.land(landed)).to eq 'Plane has touched down!!'
    end
    
    it "can't land in stormy weather" do
      stormy_landing = double(landed: "It is too stormy to land now.")
      expect(plane.land(stormy_landing)).to eq 'It is too stormy to land now.'
    end
    
    it 'can only land if in the air' do
      plane.land(landed)
      expect {plane.land(landed)}.to raise_error "Already on the ground"
    end
  end
  
  describe 'can take off from an airport' do
    
    before do
      plane.land(landed)
    end
    
    it 'leaves an airport' do
      expect(plane.take_off(leave)).to eq 'Plane has taken off!!'
    end
    
    it "can't take off in stormy weather" do
      stormy = double(leave_gate: "It is too stormy to take off.")
      expect(plane.take_off(stormy)).to eq "It is too stormy to take off."
    end
    
    it 'can only take off if on the ground' do
      plane.take_off(leave)
      expect { plane.take_off(leave) }.to raise_error "Already in the air"
    end
  end
end