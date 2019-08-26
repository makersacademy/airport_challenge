require 'airport'

describe Airport do
  it 'responds to #land(plane)' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to #take_off(plane)' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'records planes that have landed' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end
end
