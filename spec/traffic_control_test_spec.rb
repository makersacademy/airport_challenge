require './lib/traffic_control'
require './spec/support/shared_examples_for_traffic_control_test'

class TrafficControlTest
  include TrafficControl
end

describe TrafficControlTest do
  it_behaves_like TrafficControl
end