require 'airport'

RSpec.feature "Multiple Planes", :type => :feature do
  Rspec.describe "Multiple Planes Landing" do
    allow(Kernel).to receive(:rand).and_return(10)
    airport = Airport.new
    planes = []
    10.times{ planes << Plane.new}

    planes[0..4].each {|plane| airport.land(plane)}

    expect(airport.instance_variable_get(:@landed_planes)).to eq(planes[0..4])
  end
end
