require 'airport'
describe Airport do

  subject(:airport) { described_class.new }

  it 'instructs a plane to land at airport' do
    expect(airport).to respond_to(:land_plane).with(1).argument
  end

end
