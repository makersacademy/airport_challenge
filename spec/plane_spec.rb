require './lib/plane.rb'

 describe Plane do

   context "Expects that plane will respond to plane methods" do

     it "expects plane to respond to land_at method" do
       expect(subject).to respond_to(:land_at).with(1).argument
     end

   end 







    #  it "expects plane to respond to take_off method" do
    #    expect(subject).to respond_to(:take_off)
    #  end










end
