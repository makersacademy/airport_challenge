require 'airport'

describe Airport do
    
    it { is_expected.to respond_to(:hangar) }
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:weather) }
    
    subject (:airport) { described_class.new }
    let (:plane) { double :plane }
    
        describe '#land(plane)' do
            
            it 'checks a plane has landed' do
               airport.land(plane)
               expect(airport.hangar).to include(plane)
            end
            
        end
        
        describe '#take_off' do
            
            it 'intstructs a plane to take off' do
                airport.land(plane)
                expect(airport.take_off).to eq plane
            end
            
            it 'removes plane from airport hangar' do
                airport.land(plane)
                hangar_length = airport.hangar.length
                airport.take_off
                expect(airport.hangar.length).to eq(hangar_length - 1)
            end
            
        end
        
        context 'stormy weather' do
        
            describe '#land(plane)' do
                it 'raises an error when trying to land a plane in stormy weather' do 
                    
                end
            end
        
        end
end