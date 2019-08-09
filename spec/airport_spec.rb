require './docs/airport'
describe Airport do

  it 'can make a new airport' do
    expect(subject).to be_kind_of(Airport)
  end

  it { is_expected.to respond_to :land_plane }
end
