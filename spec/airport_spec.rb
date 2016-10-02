require 'airport'

describe Airport do
airport = Airport.new
  it 'reads land method' do
    expect(airport).to respond_to (:land)
  end

  it 'reads land argument' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'reads attr_reader' do
    expect(airport).to respond_to(:plane)
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it 'plane takes off' do
    expect(airport).to respond_to(:take_off)
  end

end
