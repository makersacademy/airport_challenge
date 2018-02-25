require 'plane'
# Plane class spec file

describe Plane do
  it 'initializes one argument (Plane id)' do
    expect(Plane).to respond_to(:new).with(1).argument
  end

  it 'Saves plane id given at new() to var id' do
    new_plane = Plane.new(256)
    expect(new_plane.id).to eq(256)
  end
end
