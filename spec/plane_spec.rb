require './lib/plane.rb'

 describe Plane do
   let(:airport) {double :airport}
   let(:plane) {double :plane}

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
       allow(airport).to receive(:capacity).and_return(20)
       allow(airport).to receive(:landing_bay).and_return([plane])

       subject.land_at(airport)

      unless "Stormy" then expect(subject.flying).to eq false end
      unless "Stormy" then expect(subject.flying).to eq false end
      unless "Stormy" then expect(subject.flying).to eq false end
     end

     it "expects that the plan can not land if it is already landed" do
       allow(airport).to receive(:store_plane).and_return(true)
       allow(airport).to receive(:capacity).and_return(20)
       allow(airport).to receive(:landing_bay).and_return([plane])

       subject.land_at(airport)

       unless "Stormy" then expect(subject.land_at(airport)).to eq :plane_is_on_the_ground_message end
      end

      it "expects that the plane can not land if the landing bay is at capacity" do
        allow(airport).to receive(:store_plane).and_return(true)
        allow(airport).to receive(:capacity).and_return(20)
        allow(airport).to receive(:landing_bay).and_return([plane])
        20.times {subject.land_at(airport)}

        unless "Stormy" then expect(subject.land_at(airport)).to eq :loading_bay_is_too_full_to_land_planes end
      end

   end

   context "expects take_off_from method will fly the plane " do

       it "subject should be flying if it has taken off" do
         allow(airport).to receive(:store_plane).and_return(true)
         allow(airport).to receive(:capacity).and_return(20)
         allow(airport).to receive(:landing_bay).and_return([plane])

         subject.land_at(airport)
         subject.take_off_from(airport)

        unless "Stormy" then expect(subject.flying).to eq true end
        unless "Stormy" then expect(subject.flying).to eq true end
        unless "Stormy" then expect(subject.flying).to eq true end
       end



         it "subject should not be able to take off twice" do
           allow(airport).to receive(:store_plane).and_return(true)
           allow(airport).to receive(:capacity).and_return(20)
           allow(airport).to receive(:landing_bay).and_return([plane])

          subject.land_at(airport)
          subject.take_off_from(airport)


          unless "Stormy" then expect(subject.take_off_from(airport)).to eq :plane_is_in_the_air_already_message end
          end




   end
   context "expects that the switch flying method will change the state of the method flying" do

     it "subjects flying method should return true if flying" do
       allow(airport).to receive(:store_plane).and_return(true)
       allow(airport).to receive(:capacity).and_return(20)
       allow(airport).to receive(:landing_bay).and_return([plane])

       subject.land_at(airport)

       unless "Stormy" then expect(subject.flying).to eq false end
       unless "Stormy" then expect(subject.flying).to eq false end
       unless "Stormy" then expect(subject.flying).to eq false end
     end
   end


 end









    #  it "expects plane to respond to take_off method" do
    #    expect(subject).to respond_to(:take_off)
    #  end
