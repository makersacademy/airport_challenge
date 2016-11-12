require './lib/plane.rb'

 describe Plane do
   let(:airport) {double :airport}

   context "Expects that plane will respond to plane methods" do

     it "expects plane to respond to land_at method" do
       expect(subject).to respond_to(:land_at).with(1).argument
     end

     it "expects plane to respond to take_off method" do
       expect(subject).to respond_to(:take_off_from).with(1).argument
     end

     it "expects plane to respond to switch_flying method" do
       expect(subject).to respond_to(:switch_flying)
     end
   end

   context "expects plane land_at method will land the plane at the airport" do

     it "expects flying to return false when subject has landed" do
       allow(airport).to receive(:store_plane).and_return(true)

       subject.land_at(airport)

       expect(subject.flying).to eq false
     end
   end

   context "expects take_off_from method will fly the plane " do

       it "subject should be flying if it has taken off" do
         heathrow = Airport.new
         subject.take_off_from(heathrow)

         expect(subject.flying).to eq true
       end
   end
   context "expects that the switch flying method will change the state of the method flying" do

     it "subjects flying method should return true if flying" do
       allow(airport).to receive(:store_plane).and_return(true)

       subject.land_at(airport)

       expect(subject.flying).to eq false
     end
   end


 end









    #  it "expects plane to respond to take_off method" do
    #    expect(subject).to respond_to(:take_off)
    #  end
