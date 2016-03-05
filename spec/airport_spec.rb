require 'airport'

describe Airport do
 subject(:airport) { described_class.new }
   let(:plane) { double :plane }

  describe '#land' do 
  
    it { is_expected.to respond_to(:land).with(1).argument }
  
    it "will store the plane in hangar" do
          subject.land(plane)
      expect(subject.hangar.include? plane).to eq true

    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    it 'will not have plane in hangar after take_off' do  
      allow(plane).to receive(:take_off).and_return(true)
      subject.land(plane)
      subject.take_off(plane)
      expect((subject).hangar.include? plane).to eq false
    end
    
    it 'will call plane.take_off' do
      allow(plane).to receive(:take_off).and_return(true)
      expect(plane).to receive(:take_off)
      subject.take_off(plane) 
    end
   
  end

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
  end  

end
