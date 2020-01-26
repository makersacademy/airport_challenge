require 'airport'

describe Airport do
  subject (:airport){ described_class.new(20) }
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
  it 'Not allowed to land when at the capacity' do
    20.times do
      airport.land_plane(:plane)
    end
    expect { airport.land_plane(:plane) }.to raise_error 'Can not land: airport is full'
    end
  end
