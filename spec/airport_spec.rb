require 'airport'

describe Airport do

  it "Makes sure the Airport class responds to include_plane? method" do
    airport_new = Airport.new("Name")
    expect(airport_new).to respond_to(:include_plane?).with(1).argument
  end

end
