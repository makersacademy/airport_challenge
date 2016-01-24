require 'airplane'

describe Airplane do

  subject(:airplane) {described_class.new}

  describe 'flying' do
    it 'plane flyyyyy' do
      airplane.plane_landed
      airplane.plane_taken_off
      expect(airplane.flying).to eq(true)
    end

    it 'flying = true' do
      expect(airplane.flying).to eq(true)
    end
  end

  describe 'landing' do
    it 'plane lands' do
      airplane.plane_landed
      expect(airplane.flying).to eq(false)
    end
  end
end
