require 'weather'

describe Weather do
    it {is_expected.to respond_to(:stormy) }

    it 'sets the weather to stormy' do
        allow(subject).to receive(:stormy).and_return true
        expect(subject.stormy).to eq true
    end

    it 'sets the weather to sunny' do
        allow(subject).to receive(:stormy).and_return false
    end
     
end 