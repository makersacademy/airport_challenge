require 'airport'

describe Airport do
  # desribe '#land_plane' do - add in nested desribe statements for each method 
  it { is_expected.to respond_to :land_plane}

  it 'lands a plane' do
    expect(Airport.new.land_plane).to eq("Plane has landed")
  end
end
