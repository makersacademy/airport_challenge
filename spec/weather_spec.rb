require 'weather'

describe Weather do
    let(:weather) {double :weather, :sunny= => true, sunny?: true}
    
    it 'checks if sunny so plane can take off' do
        expect(weather).to be_sunny
    end

    let(:weather2) {double :weather2, :sunny= => false, sunny?: false}

    it 'checks is not sunny so plane does not take off' do
        expect(weather2).to_not be_sunny
    end
end