require 'Airplane'

describe Airplane do
  it 'create Airplane class' do
    plane = Airplane.new
  end

  it 'landPlane' do
    plane = Airplane.new
    expect(plane.landPlane).to eq true

  end

  it 'takeOff' do
    plane = Airplane.new
    expect(plane.takeOff).to eq false
  end
end