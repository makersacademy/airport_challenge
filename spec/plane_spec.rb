require 'aeroplane'

describe Aeroplane do
  let(:airport) { double(:airport) }
  before(:each) do
    @plane = Aeroplane.new
  end
  context 'responses' do
    it { is_expected.to respond_to :landed? }
    it { is_expected.to respond_to :set_landed}
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
  end

end
