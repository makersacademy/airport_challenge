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
    
    subject(:airport){ described_class.new }
    let(:plane){ double :plane }
    
    context 'airport capacity' do
    
        it 'should have a maximum capacity' do
            allow(airport).to receive(:weather) { 'sunny' }
            airplane = 0
            airport.capacity.times do 
                airport.land(airplane)
                airplane += 1
            end
            expect { airport.land(plane) }.to raise_error 'airport is at capacity'
        end
        
        it 'can be overriden on initialize' do 
            random_capacity = rand(100)
            aeropuerto = Airport.new(random_capacity)
            expect(aeropuerto.capacity).to eq random_capacity    
        end
        
        it 'can be redefined at any point' do
            random_capacity = rand(100)
            airport.capacity = random_capacity
            expect(airport.capacity).to eq(random_capacity)
        end
    
    end
    
        
    context ' good weather' do
        
        describe '#land(plane)' do
            
            before do 
                allow(airport).to receive(:weather) { 'sunny' }
            end
            
            it 'checks a plane has landed' do
                airport.land(plane)
                expect(airport.hangar).to include(plane)
            end
            
            it 'should not land same plane twice' do
                airport.land(plane)
                airport.land(plane)
                expect(airport.hangar.length).to eq 1
            end
        end

        describe '#take_off' do
            
            before do
                allow(airport).to receive(:weather) { 'sunny' }
            end
            
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
            
            it 'should raise an error if the airport is empty' do
                expect { airport.take_off }.to raise_error 'airport is devoid of planes'
            end
        end
    end
    
    
    context 'bad weather' do
    
        describe '#land(plane)' do 
           it 'cannot land a plane' do
                allow(airport).to receive(:weather){ 'stormy' }
                expect { airport.land(plane) }.to raise_error 'It\'s too stormy to land!'
            end
        end
        
        describe '#take_off' do
            it ' plane cannot take off' do
                allow(airport).to receive(:weather){ 'stormy' }
                expect {airport.take_off}.to raise_error 'It\'s too stormy!'
            end
        end
    end
end