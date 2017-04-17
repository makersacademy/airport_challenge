require './lib/Plane.rb'
require './lib/Airport.rb'

describe Plane do
  describe "changing_altitude" do
   it { should respond_to(:landing) }
   it { should respond_to(:taking_off) }
  end
end