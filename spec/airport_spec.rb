require 'airport'

describe Airport do
  it 'responds to #land' do 
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'returns plane after #land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it 'responds to #take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
