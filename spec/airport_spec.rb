require 'airport.rb'

describe Airport do
  it 'creates a plane when taking off' do
    expect(subject).to respond_to :take_off
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'responds to plane method' do
     expect(subject).to respond_to :plane
   end

  it 'returns landed planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

end
