AIRPORT.RB
require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport

  def instruct_land(plane)
    weather = Weather.new
    weather.stormy ? raise("Plane can't land due to stormy weather") : plane.landed
  end

  def instruct_takeoff(plane)
    weather = Weather.new
    weather ? raise("Plane can't take-off due to stormy weather") : plane.takeoff
  end


end


=============


PLANE.RB
class Plane

  def initialize
    @landed = false
    @flying = true
  end

  def landed
    @flying = false
    @landed = true
  end

  def takeoff
    @landed = false
    @flying = true
  end

end



====================


WEATHER.RB
class Weather
  attr_reader :stormy_weather

#  def initialize
#    @stormy_weather = Random.rand(100) < 20 ? true : false
#  end

  def stormy
    @stormy_weather = Random.rand(100) < 20 ? true : false
  end

end
=begin
  def stormy_weather
    @weather > 20 ? false : true
  end

end
=end


======================
AIRPORT SPEC

require "airport"
require "plane"

describe Airport do

  it "instructs plane to land" do
    plane = Plane.new
    #allow(subject.instruct_land(plane)).to receive(:weather.stormy) { false }
    expect(subject.instruct_land(plane)).to eq true
  end

  it "won't let a plane land if the weather is stormy" do
    plane = Plane.new
    allow(subject.instruct_land(plane)).to receive(:weather.stormy) { true }
    expect{subject.instruct_land(plane)}.to raise_error(RuntimeError)
  end


  it "instructs plane to take-off" do
    plane = Plane.new
    #allow(subject.instruct_takeoff(plane)).to receive(:weather) { false }
    expect(subject.instruct_takeoff(plane)).to eq true
  end

  it "won't let a plane take-off if the weather is stormy" do
    plane = Plane.new
    allow(subject.instruct_takeoff(plane)).to receive(:weather) { true }
    expect{subject.instruct_takeoff(plane)}.to raise_error(RuntimeError)
  end

end




===================

PLANE SPEC


require "plane"

describe Plane do

  it "confirms the landing" do
    expect(subject.landed).to eq true
  end

  it "confirms the take-off" do
    expect(subject.takeoff).to eq true
  end

end


=====================


WEATHER SPEC

require "weather"

describe Weather do

  it "is stormy" do
    allow(subject).to receive(:stormy_weather) { true }
    expect(subject.stormy_weather).to eq true
  end

  it "is sunny" do
    allow(subject).to receive(:stormy_weather) {false}
    expect(subject.stormy_weather).to eq false  
  end

end


=====================
