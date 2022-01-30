require 'Airport'

describe Airport do
  it "instructs the plane to land" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end


  it 'Instruct the plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end