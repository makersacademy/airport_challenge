require './spec/support/shared_examples_for_takeoff_land.rb'
require 'takeoff_land'

class TakeoffLandTest
  include TakeoffLand
end

describe TakeoffLandTest do
  it_behaves_like TakeoffLand
end
