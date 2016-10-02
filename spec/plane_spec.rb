require "plane"

describe Plane do

  subject(:plane) {described_class.new}

  describe '#status' do
    it {is_expected.to respond_to(:status)}
  end

  describe '#flying?' do
    it {is_expected.to respond_to(:flying?)}
  end

  describe '#landed?' do
    it {is_expected.to respond_to(:landed?)}
  end
end
