require 'weather'

describe Weather do
    let(:weather) {double :weather, :good= => true, good?: true}
    it {is_expected.to respond_to(:good)}

    it {is_expected.to respond_to(:good?)}

    it 'checks weather condition' do
        expect(weather).to be_good
    end

end