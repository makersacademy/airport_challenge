require 'plane'

describe Plane do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it { is_expected.to respond_to(:take_off) }
    
    it { is_expected.to respond_to(:landed) }
    
    it { is_expected.to respond_to(:airport) }
    
    subject { described_class.new }
    
    let(:airport) { double :airport }

    describe '#land' do
        before do
            allow(airport).to receive(:stormy?).and_return(false)
            allow(airport).to receive(:planes).and_return([])
            allow(airport).to receive(:capacity).and_return(Airport::DEFAULT_CAPACITY)
            subject.land(airport)
        end
        
        it 'can\'t land at full airports' do
            capacity = Airport::DEFAULT_CAPACITY
            error_message = "Airport full"
            fill = Proc.new {capacity.times{ described_class.new.land(airport) } }
            expect{ fill.call }.to raise_error error_message
        end
        
        it 'adds a :plane to airport planes' do
            expect(airport.planes).to include(:plane)
        end
        
        it 'changes @landed state to true' do
            expect(subject.landed).to eq true
        end
        
        it 'it sets @airport to the airport it landed at' do
            expect(subject.airport).to eq airport    
        end
        
        it 'can\'t land again when already landed' do
            error_message = "Plane already landed"
            expect{ subject.land(airport) }.to raise_error error_message
        end
     
        it 'can\'t land when stormy' do
            subject.take_off
            allow(airport).to receive(:stormy?).and_return(true)
            error_message = "Too stormy to land"
            expect{ subject.land(airport) }.to raise_error error_message
        end
    end
    
    describe '#take_off' do
        before do
            allow(airport).to receive(:stormy?).and_return(false)
            allow(airport).to receive(:planes).and_return([])
            allow(airport).to receive(:capacity).and_return(Airport::DEFAULT_CAPACITY)
            subject.land(airport)
            subject.take_off
        end
        
        it 'removes a :plane from airport.planes' do
            expect(airport.planes).to eq []
        end
        
        it 'sets @landed to false' do
            expect(subject.landed).to eq false
        end
        
        it 'sets current airport to flying' do
            expect(subject.airport).to eq :flying
        end
        
        it 'can\'t take off when already flying' do
            error_message = "Plane already flying"
            expect{ subject.take_off }.to raise_error error_message
        end
        
        it 'can\'t take off when stormy' do
            subject.land(airport)
            allow(airport).to receive(:stormy?).and_return(true)
            error_message = "Too stormy to take off"
            expect{ subject.take_off }.to raise_error error_message
        end
    end
end