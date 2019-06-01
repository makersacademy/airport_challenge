require 'controller'

describe Controller do
  it 'can respond to a request to decide to land a plane' do
    expect(subject).to respond_to(:land_plane?)
  end
end