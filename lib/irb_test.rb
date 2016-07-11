require_relative 'airport'

stanstead = Airport.new
gatwick = Airport.new
boeing_747 = Plane.new
private_jet = Plane.new
stanstead.instruct_landing(boeing_747)
boeing_747.lands
boeing_747.landed?
stanstead.instruct_landing(private_jet)
private_jet.lands
private_jet.landed?
