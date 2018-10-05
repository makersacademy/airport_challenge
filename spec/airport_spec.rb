require 'airport'

describe Airport do

  it 'instructs a plane to land' do
    expect(subject.plane_land).to eq "Please land your plane."
  end

  it 'instructs a plane to take off' do
    expect(subject.plane_take_off).to eq "Please take off."
  end

  it 'checks if airport has a plane' do
    expect(subject.has_plane?).to eq false
  end


end
