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
    # it 'when a plane has taken off from the airport, it returns false' do
      
    # end

  end

    

end
