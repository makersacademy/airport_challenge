
require 'airplane'

RSpec.describe Airplane do
  subject(:airplane) { described_class.new }

  describe '#initialization' do
    it 'generate an on-coming plane' do
      expect(airplane.landed).to eq false
    end
  end

  describe '#land' do
    it 'change the plane status to landed' do
      airplane.land
      expect(airplane.landed).to eq true
    end
  end

  describe '#takeoff' do
    it 'change the plane status to not landed' do
      airplane.takeoff
      expect(airplane.landed).to eq false
    end
  end
end
