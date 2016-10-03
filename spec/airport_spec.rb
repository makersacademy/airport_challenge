require 'plane'
require 'airport'

describe Airport do

  it { should respond_to :cleared_landing, :cleared_takeoff, :weather }

  it 'clears for landing' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.planes[0]).to eq plane
  end

  it 'clears for takeoff' do
    plane = Plane.new
    plane.takeoff(subject)
    expect(subject.planes).to be_empty
  end

  it 'sets the weather' do
    expect(subject.weather).to eq 'sunny' || 'stormy'
  end
end
