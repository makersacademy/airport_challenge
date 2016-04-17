require 'airport'

describe Airport do
    
    it { is_expected.to respond_to(:hangar) }
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:weather) }
    
    describe '#weather' do 
        
        it 'should report something' do
            expect(subject.weather).to be_truthy
        end
        
    end
    
    subject (:airport) { described_class.new }
    let (:plane) { double :plane }
    
        
    context ' good weather' do
            
        describe '#land(plane)' do
                
            it 'checks a plane has landed' do
                allow(airport).to receive(:weather) { 'sunny' }
                airport.land(plane)
                expect(airport.hangar).to include(plane)
            end
                
        end

        describe '#take_off' do
            
            it 'intstructs a plane to take off' do
                allow(airport).to receive(:weather) { 'sunny' }
                airport.land(plane)
                expect(airport.take_off).to eq plane
            end
            
            it 'removes plane from airport hangar' do
                allow(airport).to receive(:weather) { 'sunny' }
                airport.land(plane)
                hangar_length = airport.hangar.length
                airport.take_off
                expect(airport.hangar.length).to eq(hangar_length - 1)
            end
            
        end
    end
    
    
    context 'bad weather' do
    
        describe '#land(plane)' do 
           
            it 'cannot land a plane in stormy weather' do
                allow(airport).to receive(:weather) { 'stormy' }
                expect { airport.land(plane) }.to raise_error 'It\'s too stormy to land!'
            end
           
        end
        
        describe '#take_off' do
        
            it ' plane cannot take off in stormy weather' do
            allow(airport).to receive(:weather) { 'stormy' }
            expect {airport.take_off}.to raise_error 'It\'s too stormy to launch a plane!'
            end
        
        end
    
    end
end