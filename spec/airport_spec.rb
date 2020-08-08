require 'airport'

describe Airport do
  it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it { is_expected.to respond_to :land_plane }
end
