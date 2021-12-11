require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :depart }  

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane] #tests that land method on an airport instance will 'store' the plane instance and return the plane
  end

  it 'departs a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.depart).to eq [] #tests that depart method will work on aiport and will confirm that airport is empty after the plane has departed
  end
end