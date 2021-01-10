require 'weather'

describe Weather do

    # it 'should respond to stormy?' do
    #     expect(subject).to respond_to(:stormy?)
    # end

    it 'should respond to stormy?' do
        expect(subject).to respond_to(:stormy?)
    end

    it 'can be reported stormy' do
        # subject.reported_stormy
        expect(subject).to be_stormy
    end

end