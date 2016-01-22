require 'airport'

describe Airport do
  it {expect(subject).to be_a Airport}  
  
  describe 'airport lets us know when a plane has landed' do
    it {expect(subject).to respond_to(:landed?)}
    
    it 'returns string if plane has landed' do
      expect(subject.landed?).to eq 'Plane has touched down!!'
    end
  end
end