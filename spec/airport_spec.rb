require 'airport'
require 'plane'

describe Airport do

  describe "is an instance of the Airport class"
  it {expect(subject.is_a?(Airport)).to eq true}

  describe "has a default capacity of 5"
  it {expect(subject.capacity).to eq(5)}

  describe "can check if there is a storm"
  it {is_expected.to respond_to(:conditions_good?)}

  describe "can land a plane"
  it {is_expected.to respond_to(:land).with(1).argument}

  describe "can check remaining cpacity"
  it {expect(subject.space_to_land?).to eq true}

  describe "can only land plane if there is capacity"
  jfk = Airport.new(0)
  ba_99 = Plane.new
  it {expect(jfk.space_to_land?).to eq false}
  it {expect(jfk.land(ba_99)).to eq "No more landing space"}




end
