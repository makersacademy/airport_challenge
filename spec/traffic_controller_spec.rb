require 'traffic_controller'

describe TrafficController do 
  it { is_expected.to respond_to(:depart_airport) }
end 
