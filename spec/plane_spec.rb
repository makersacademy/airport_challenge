require './lib/plane.rb'

 describe Plane do

   let(:plane) {double :plane}
   let(:airport) {double :airport}

   context "Expects that plane will respond to plane methods" do

     it "expects plane to respond to land_at method" do
       expect(subject).to respond_to(:land_at).with(1).argument
     end

     

   end

   context "Expects that plane will change to different states when methods are called" do


   end

 end









    #  it "expects plane to respond to take_off method" do
    #    expect(subject).to respond_to(:take_off)
    #  end
