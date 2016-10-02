describe Plane do
  subject(:plane) {Plane.new}

  it 'should change flying status upon landing' do
    expect(plane.flying?).to be false
  end



end
