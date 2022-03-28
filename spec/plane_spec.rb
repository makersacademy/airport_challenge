require_relative '../lib/plane'

describe Plane do

  let(:airport) { double :airport }

  it 'Checks object is an instance of class Plane' do
    expect(subject).to be_an_instance_of(Plane)
  end

  it '#land' do
    expect(subject).to respond_to :land
  end

  it '#land - Returns the plane object that has landed' do
    expect(subject.land(double(:store_plane => subject))).to eq("Plane lands at the airport")
  end

  it '#take_off' do
    expect(subject).to respond_to :take_off
  end

  it '#take_off - Checks plane has been removed from the airport hangar' do
    double(:hangar => [subject])
    expect(subject.take_off(double(:remove_plane_from_hangar => nil))).to eq "Plane takes off"
  end
end
