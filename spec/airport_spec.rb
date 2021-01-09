require 'airport'

describe Airport do
    it 'should land plane in airport' do
        expect(subject).to respond_to :land?
    end

end