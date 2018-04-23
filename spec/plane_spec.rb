require 'plane'

describe '#land' do
# it 'can instruct a plane to land in an Airport' do
  it { is_expected.to respond_to(:land).with(1).argument }
end
