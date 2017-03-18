require './lib/airport.rb'

describe Airport do
  it 'responds to "release plane"' do
    expect(subject).to respond_to :release_plane
  end

end
