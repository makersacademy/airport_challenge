require 'plane'

describe Plane do
    
    subject (:plane) { described_class.new }
    let(:airport) { double :airport }
    
    it { is_expected.to respond_to(:landed?) }
    
    context 'landing' do
        describe '#landed?' do
            it 'should return true if a plane has landed' do
                
                airport.land(plane)
                expect(plane.landed?).to eq true
            end
        end
    end
   
end