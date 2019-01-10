require 'airport'

RSpec.describe Airport do

  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  # describe '#land' do
  it { is_expected.to respond_to(:land) }  
  
  it "can instruct a plane to land at an airport" do
    # plane = Plane.new
    expect(subject.land).to eq(true)
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it { is_expected.to respond_to(:take_off) }

  it "can tell a plane to take off and confirm it leaves airport" do
    expect(subject.take_off).to eq(true)
  end

end