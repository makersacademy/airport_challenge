describe Plane do
  subject(:plane) {Plane.new}

  it 'should change flying status upon landing' do
    expect(plane.flying?).to be false
  end

  it 'should change flying status upon take_off' do
    plane.taking_off
    expect(plane.flying?).to be true
  end


end
