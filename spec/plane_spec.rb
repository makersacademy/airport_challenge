require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe 'status' do
    it 'changes plane status is flying if not in hangar' do
      expect(plane.status).to eq 'flying'
    end

    it 'changes plane status if plane lands' do
      plane.adjust_status('landed')
      expect(plane.status).to eq 'landed'
    end

    it 'changes plane status if plane takes off' do
      plane.adjust_status('flying')
      expect(plane.status).to eq 'flying'
    end
  end
end
