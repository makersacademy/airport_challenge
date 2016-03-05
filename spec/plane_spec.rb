require 'plane'
describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :landed? }

  it 'lands at an airport and confirms that it has landed' do # divide into two tests?
  end
end
