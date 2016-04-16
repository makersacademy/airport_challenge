require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  it { is_expected.to respond_to :receive_plane }
  
end