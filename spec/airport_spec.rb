require 'airport'

describe Airport do
 subject(:airport) { described_class.new }
   let(:plane) { double :plane }

  describe '#land'do 
  
    it { is_expected.to respond_to(:land).with(1).argument }
  
    it "will store the plane in hangar" do
          subject.land(plane)
      expect(subject.hangar.include? plane).to eq true

    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    it 'will not have plane in hangar after take_off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar.include? plane).to eq false
    end
  end 
end
