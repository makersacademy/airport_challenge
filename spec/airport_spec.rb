require 'airport'

describe Airport do

    # test that responds to land_plane method
    it { is_expected.to respond_to :land_plane }

    # test to prevent landing when weather is stormy
      describe "when stormy" do
        before do
          allow(subject).to receive(:stormy?).and_return true
        end
        it "raises an error message if landing requested in stormy weather" do
          expect { subject.land_plane }.to raise_error "Plane cannot land as weather is stormy"
        end
      end

    # test that responds to take_off method and confirms plane is no longer in the airport
    it { is_expected.to respond_to :take_off } #need to add test here re. return message

    # test to prevent take off when weather is stormy
      describe "when stormy" do
        before do
          allow(subject).to receive(:stormy?).and_return true
        end
        it "raises an error message if take off requested in stormy weather" do
          expect { subject.take_off }.to raise_error "Plane cannot take off as weather is stormy"
        end
      end

      # test to prevent landing when airport is full
        describe "when airport is full" do
          before do
            allow(subject).to receive(:full?).and_return true
          end
          it "raises an error message if landing requested and airport full " do
            expect { subject.land_plane }.to raise_error "Plane cannot land as airport is full!"
            end
        end
end
