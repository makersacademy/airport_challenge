require_relative '../lib/plane.rb'

describe Plane do
  describe '#landed' do
    it "plane object will return false to flying? after it has landed" do
      expect(Plane.new.landed.flying?).to eq false
    end
  end

  describe '#taken_off' do
    it "plane object will return true to flying? after it has taken_off" do
      expect(Plane.new.taken_off.flying?).to eq true
    end
  end
end
