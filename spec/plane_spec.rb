require 'plane'

describe Plane do
    it 'responds to .land_at method' do
        expect(subject).to respond_to :land_at
    end
end