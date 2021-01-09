require 'weather'

describe Weather do

    it 'should respond to stormy?' do
        expect(subject).to respond_to(:stormy?)
    end

    it 'can be reported stormy' do
        expect(subject.reported_stormy).to eq(true)
    end

end