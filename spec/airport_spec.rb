require 'airport'

describe Airport do
  it 'responds to #take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'plane takes off from airport' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.take_off(plane)).to be_a Plane
  end
  # 
  # it 'it raises an error if weather is stormy' do
  #   subject.weather == "stormy"
  #   expect {subject.weather}.to raise_error("Weather is too stormy")
  # end
  #

  it 'responds to #land' do
    expect(subject).to respond_to :land
  end

  it 'lands a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to be_a Plane
  end

  it 'is full' do
    expect(subject.full?(11)).to eq true
  end

  it 'has a specific plane in the airport' do
    expect(subject.plane_in_airport?).to eq true
  end

end
