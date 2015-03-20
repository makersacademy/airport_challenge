require 'plane'

describe Plane do
  it { is_expected.to respond_to :flying? }
  context 'when created' do
    it { is_expected.to be_flying }
  end
end
describe Plane do
  it { is_expected.to respond_to :landed? }
  context 'when landed' do
    it { is_expected.to be_landed }
  end
end
