require 'plane'

describe Plane do
  subject(:plane) { described_class.new } 
  let(:not_landed_plane) { allow(subject).to receive(:landed?).and_return(false) }
  let(:landed_plane) { allow(subject).to receive(:landed?).and_return(true) }

  describe '#land' do
    
    it { is_expected.to respond_to(:land) }
 
    it 'should call landed' do
      not_landed_plane
      expect(subject).to receive(:landed?)
      subject.land 
    end
    
    it 'should give error if already landed' do
      landed_plane
      expect { subject.land }.to raise_error "hmmm, it looks like we have that plane down as already landed, can you check the reference"
    end  
  
  end
  
  describe '#landed?' do
    
    it { is_expected.to respond_to(:landed?) }
  
    it 'will return false when a plane has taken off' do
      allow(subject).to receive(:taken_off).and_return true
      expect(subject.landed?).to eq false
    end
  
  end

  describe '#take_off' do 

    it { is_expected.to respond_to(:take_off) }
  
  end

end


 
   


