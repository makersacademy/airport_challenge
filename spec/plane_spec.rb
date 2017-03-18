require 'plane'

    describe Plane do

      it "has a method to confirm plane has landed" do
        expect(subject).to respond_to(:plane_landed?)
      end

      describe '#land_plane' do
        it 'Instructs plane to land' do
          expect(subject).to respond_to(:land_plane)
        end
      end

      describe "#plane_landed?" do
        it "Confirms plane has landed" do
          subject.land_plane
          expect(subject.plane_landed?).to eq true
        end
      end

    end
