require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  it 'responds to land_plane method' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end
end
