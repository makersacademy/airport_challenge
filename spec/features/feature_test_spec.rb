require "airport"
require "plane"
require 'spec_helper'
require 'capybara/rspec'

feature "Airport Challenge feature test" do
  # scenario "User creates new plane and gets flying plane" do
  #   plane=Plane.new
  #   expect(plane).to be_an_instance_of Plane
  #   expect(plane.status).to eq(:flying)
  # end
  # scenario "User creates new airport and gets airport" do
  #   expect(Airport.new).to be_an_instance_of Airport
  # end
  scenario "User lands plane if space and good weather - simple case" do
    plane=Plane.new
    airport=Airport.new
    allow(airport).to receive(:report_weather).and_return(:sunny)
    allow(airport).to receive(:full?).and_return(false)
    expect(airport.land_plane(plane)).to include(plane)
  end

  scenario "Busy day at airport - step-by-step" do
    airport=Airport.new
    p1=Plane.new
    p2=Plane.new
    p3=Plane.new
    p4=Plane.new
    p5=Plane.new
    allow(airport).to receive(:report_weather).and_return(:sunny)
    expect(airport.land_plane(p1)).to eq([p1])
    expect(p1.status).to eq(:landed)
    pnh_err='Plane is not here'
    expect{airport.launch_plane(p2)}.to raise_error pnh_err
    expect(p2.status).to eq(:flying)
    airport.land_plane(p3)
    airport.land_plane(p4)
    expect(airport.land_plane(p5)).to include(p1, p3, p4, p5)
    expect(airport.launch_plane(p1)).to include(p3,p4,p5)
    expect(p3.status).to eq(:landed)
    expect(p1.status).to eq(:flying)
  end


  # scenario "User creates new airport" do
  #   expect(Airport.new).to be_an_instance_of Airport
  # end
  # scenario "User creates new airport" do
  #   expect(Airport.new).to be_an_instance_of Airport
  # end

end
