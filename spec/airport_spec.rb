require "airport"

describe Airport do
 it 'allows planes to land' do
    expect(subject).to respond_to :land_a_plane
  end
 end 
 
def land_a_plane
end