require_relative '../lib/plane.rb'

describe Plane do 
  let(:airport) { double :airport }

  describe '#flying?' do
    it 'responds to flying?' do 
      expect(subject).to respond_to(:flying?)
    end
    it 'when plane is landed in an airport, it returns false' do
      allow(airport).to receive(:land).and_return("Your plane has been successfully stored")
      airport.land(subject)
      expect(subject.flying?).to eq false
    end 
    it 'can change its flying status from false to true' do
      expect(subject).not_to be_flying
      expect(subject.take_flight).to eq true
    end
  end
end
