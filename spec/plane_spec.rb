describe Plane do

  it 'creates instance of plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(airport)
  end
end