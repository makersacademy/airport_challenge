require_relative '../lib/airport.rb'

describe Airport do
    describe '#full?' do
        it {is_expected.to respond_to :full?}
    end

    describe '#stormy?' do
        it {is_expected.to respond_to :stormy?}
    end

    describe '#capacity' do
        it {is_expected.to respond_to :capacity}
    end

    it '#default capacity of airport objects' do
        expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
    end

end
