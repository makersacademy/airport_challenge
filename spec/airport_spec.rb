require 'airport'

describe Airport do
  subject (:airport){described_class.new }
# this is for the landing_plane method in airport.rb
# --below --expect the method land_plane so it fails then we need to write a method to airport file
# --below-- first part of the story
  it 'instruct a plane to lane' do
    expect(airport).to respond_to(:land_plane).with(1).argument
  end
#--below-- expect method take_off_plane to fail first
#--below-- second part of the story
  it 'instruct the plane to take off' do
    expect(airport).to respond_to(:take_off_plane).with(1).argument
  end
end
