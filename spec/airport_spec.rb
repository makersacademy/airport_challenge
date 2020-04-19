require './lib/airport.rb'

describe Airport do


    describe "#land" do
      it "plane should be able to #land" do
        expect(subject).to respond_to :land
      end
    end

    it { is_expected.to respond_to :take_off }

    it { is_expected.to respond_to :confirm_location }



end
