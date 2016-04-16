require 'airport'

describe Airport do
    
    it { is_expected.to respond_to(:hangar) }
    it { is_expected.to respond_to(:land).with(1).argument }
    
    subject (:airport) { described_class.new }
    let (:plane) { double :plane }
    
    context 'landing' do 
    
        describe '#land(plane)' do
            
            it 'checks a plane has landed' do
               airport.land(plane)
               expect(airport.hangar).to include(plane)
            end
            
        end
    end
end