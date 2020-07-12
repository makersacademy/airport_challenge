require "airport"

describe Airport do
    subject(:airport) { described_class.new }

    it "#ask plane to land" do
      expect(airport).to respond_to(:land) 
   end

   it "#ask plane to take off" do
      expect(airport).to respond_to(:take_off)
   end

end