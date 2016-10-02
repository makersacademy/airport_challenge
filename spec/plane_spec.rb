require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#landed' do

    it 'will return true if a plane has landed' do
      expect(plane.landed).to eq true
    end

  describe '#taken_off' do
    it 'will return true if a plane is grounded' do
      expect(plane.grounded).to eq false
    end

    end
  end
end
