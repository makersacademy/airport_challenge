require_relative '../lib/plane.rb'

describe Plane do
    describe '#landed'do
        it "plane object will return false to flying? after it's landed" do
            expect(Plane.new.landed.flying?).to eq false
        end
    end

    describe '#taken_off' do
        it "plane object will return true to flying? after it's taken_off" do
            expect(Plane.new.taken_off.flying?).to eq true
        end
    end
end