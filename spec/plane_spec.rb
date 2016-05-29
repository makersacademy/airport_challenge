require 'aeroplane'

describe Aeroplane do
  let(:airport) { double(:airport) }
  before(:each) do
    @plane = Aeroplane.new
  end
  context 'responses' do
    it { is_expected.to respond_to :landed? }
    it { is_expected.to respond_to :set_landed}
    it { is_expected.to respond_to :take_off }
  end
  
  context '#landed' do
    it 'unlanded plane' do
      expect(@plane.landed?).to eq false
    end

    it 'landed plane' do
      @plane.set_landed
      expect(@plane.landed?).to eq true
    end
    
  end

  context '#set_landed' do
    it "changes status of plane.landed?" do
      #expect(@plane.landed?).to eq false
      @plane.set_landed
      expect(@plane.landed?).to eq true
    end

    it "raises an error when #set_landed is called on a landed plane" do
      @plane.set_landed
      expect{ @plane.set_landed }.to raise_error("Plane is already landed")
    end
  end

  context '#take_off' do
    it "changes status of plane.landed?" do
      @plane.set_landed
      @plane.take_off
      expect(@plane.landed?).to eq false
    end

    it "raises an error when #take_off is called on a non-landed plane" do
      expect{ @plane.take_off }.to raise_error("Plane is already flying")
    end
  end
end
