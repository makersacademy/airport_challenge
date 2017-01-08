require 'airport'

describe Airport do
    
    
    describe '#stormy?' do
        let(:weather) { double :weather }
        subject { described_class.new weather }
        
        it 'can be stormy' do
            allow(weather).to receive(:stormy?).and_return(true)
            expect(subject.stormy?).to eq true
        end
        
        it 'can be clear' do
            allow(weather).to receive(:stormy?).and_return(false)
            expect(subject.stormy?).to eq false
        end
    end
end