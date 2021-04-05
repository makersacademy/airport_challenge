require 'plane'

describe Plane do
    subject(:plane) { described_class.new }

    describe '#take of' do
        it { is_expected.to respond_to :take_off }

        it 'raises error when flying' do 
            expect {plane.take_off}.to raise_error 'cant take off, already flying'
        end
    end

    describe 'airport' do
        it { is_expected.to respond_to :airport }

        it 'raises error if flying ' do
            expect {plane.airport }.to raise_error 'plane not at airport, flying'
        end
    end

end 