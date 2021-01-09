require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land, :take_off) }

    it 'confirms plane is no longer in airport after take off' do
        expect(subject.take_off).to be(true)
    end
end