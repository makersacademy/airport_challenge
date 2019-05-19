require 'plane'

describe 'plane' do
  let(:plane) { Plane.new }

  it 'should respond to plane class' do
    expect(plane).to be_a_kind_of(Plane)
  end

  it 'should respond to method takes_off' do
    expect(plane).to respond_to(:takes_off)
  end

  it 'should set flying = true when takes_off runs' do
    plane.takes_off
    expect(plane.flying?).to eq(true)
  end

  it 'should set flying = false when lands runs' do
    plane.lands
    expect(plane.flying?).to eq(false)
  end

  it 'should respond to method flying?' do
    expect(plane).to respond_to(:flying?)
  end

  it 'should respond with variable flying when flying' do
    expect(plane.flying?).to eq(false)
  end
end
