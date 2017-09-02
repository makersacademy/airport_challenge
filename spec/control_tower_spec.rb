require 'control_tower'
require 'plane'
require 'weather_report'

describe CONTROL_TOWER do

# THE FIRST BELOW WAS MY INITIAL UNIT TEST FOR THE 'LAND PLANE FUNCTION WHICH PASSED'
# IT WAS SUPERCEDED BY THE 'LAND AND CHECK' FUNCTION TEST THAT INVOLVED ADAPTING THE LAND METHOD'

#  it 'land plane' do
#    plane=PLANE.new
#    expect(subject.land(plane)).to eq true
#  end

  it 'land plane and check plane is on the runway' do
    plane=PLANE.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'take off and confirm plane is no longer on the runway' do
    plane=PLANE.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq []
  end

  #RAN THE TWO ABOVE TESTS FOR LANDING AND TAKE OFF WHEN WEATHER WAS CLEAR AND ALL PASS.
  #THESE TESTS FAIL WHEN WEATHER IS STORMY IN ORDER FOR THE TWO STORMY TESTS BELOW TO PASS.
  #I CAN CONFIRM THAT THE CONTROL TOWER OPERATES AS IT SHOULD IN EITHER WEATHER CONDITION.

  it 'prevent landing when weather is stormy' do
    plane=PLANE.new
    subject.weather_report
    expect(subject.land(plane)).to eq 'NO'
  end

  it 'prevent take off when weather is stormy' do
    plane=PLANE.new
    subject.weather_report
    expect(subject.take_off(plane)).to eq 'NO'
  end

  it 'prevent landing if airport is full' do
    plane=PLANE.new
    CONTROL_TOWER::DEFAULT_CAPACITY.times{subject.land(plane)}
    expect(subject.land(plane)).to eq 'AT CAPACITY'
  end

   it 'set airport capacity' do
     expect(subject.capacity).to eq CONTROL_TOWER::DEFAULT_CAPACITY
   end

  #it 'prevent landing is airport is full' do
  #  plane=PLANE.new
  #  CONTROL_TOWER::CAPACITY.times{subject.land(plane)}
  #  expect(subject.land(plane)).to eq 'AT CAPACITY'
#  end
end
