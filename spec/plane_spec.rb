require 'plane'

describe Plane do 

  let(:airport) { double :airport }

  describe 'is flying' do
    it 'responds to flying' do 
      expect(subject).to respond_to :flying?
    end

    it 'confirms that it has landed' do 
      allow(airport).to receive(:land).and_return true 
      allow(subject).to receive(:flying?).and_return false
    end

    it 'confirms that it is in flight' do 
      allow(airport).to receive(:launch).and_return true 
      expect(subject).to be_flying
    end
  end
end 


