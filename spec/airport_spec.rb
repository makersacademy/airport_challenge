require 'airport'

RSpec.describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it {is_expected.to respond_to(:store).with(1).argument}

  describe '#store' do
    it 'stores planes that have landed' do
      expect(subject.store(plane)).to eq [plane]
    end
  end
end
