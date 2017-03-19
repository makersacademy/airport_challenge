require './docs/plane.rb'

describe Plane do
  let(:plane) { described_class.new}

  it 'creates an instance of the Plane class' do
    expect(:plane).to eq(:plane)
  end

  it 'expects the ground method to make the plane no longer airborne' do
    plane.ground
    expect(plane.airborne).to be false
  end

  it 'expects the fly method to make the plane airborne' do
    plane.fly
    expect(plane.airborne).to be true
  end

end
