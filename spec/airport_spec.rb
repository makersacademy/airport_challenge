require_relative '../lib/airport.rb'

describe Airport do
    describe '#full?' do
        it {is_expected.to respond_to :full?}
    end

    describe '#stormy?' do
        it {is_expected.to respond_to :stormy?}
    end
end