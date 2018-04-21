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
end
