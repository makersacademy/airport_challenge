require_relative '../lib/plane.rb'

describe Plane do
    describe '#flying?' do
        it { is_expected.to respond_to :flying?}
    end

    describe '#land'do
        it 'plane object will return false to flying? after land' do
            expect(Plane.new.land.flying?).to eq false
        end
    end

    describe '#take_off' do
        it 'plane object will return true to flying? after take_off' do
            expect(Plane.new.take_off.flying?).to eq true
        end
    end
end