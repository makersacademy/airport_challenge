require 'airport'

describe Airport do
    it { is_expected.to respond_to(:stormy?) }
    
    it { is_expected.to respond_to(:planes) }
    
    subject { described_class.new }
    
    it 'has a default capacity' do
        expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    
    describe '#stormy?' do
        it 'returns a boolean' do
            expect(subject.stormy?).to be(true).or be(false)
        end
    end
end