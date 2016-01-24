require 'airport'

describe Airport do

  it 'can receive the "confirm_plane_landed" command with 1 argument' do
    expect(subject).to respond_to(:confirm_plane_landed).with(1).argument
  end

end
