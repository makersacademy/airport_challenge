require 'airport.rb'
require 'plane.rb'

describe Airport do

  it 'Landing a plane should result in num_of_plane increase by 1' do
    allow(subject).to receive(:weather) { 'sunny' }
    plane = Plane.new
    plane.land(subject)
    expect(subject.num_of_planes).to eq(1)
  end

  it 'Take off should result in num_of_plane reduce by one' do
    allow(subject).to receive(:weather) { 'sunny' }
    plane = Plane.new
    plane.land(subject)
    plane.take_off(subject)
    expect(subject.num_of_planes).to eq(0)
  end

end
