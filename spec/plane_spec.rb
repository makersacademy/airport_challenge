require 'plane'

describe Plane do

  describe '#landed?' do
    
    it 'Returns true when plane has landed (confirms)' do
      subject.land=(true)
      expect(subject.landed?).to eq true
    end

    it 'Returns false when plane has not landed (confirms)' do
      subject.land=(false)
      expect(subject.landed?).to eq false
    end
  end

  describe '#flying' do
    it "Changes plane's status to flying when plane is not landed" do
      subject.flying
      expect(subject.landed?).to eq false
    end
  end
end
