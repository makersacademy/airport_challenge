require 'weather'

describe Weather do
    describe '#stormy' do
        it 'returns true when stormy' do
            allow(subject).to receive(:stormy?).and_return(true)
            expect(subject).to be_stormy
        end

        it 'returns false when stormy' do
            allow(subject).to receive(:stormy?).and_return(false)
            expect(subject).not_to be_stormy
        end
    end


end