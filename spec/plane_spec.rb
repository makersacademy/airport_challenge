require "plane"
describe Plane do

  context "in the air and fine weather" do
    let(:airport) {double :nice_airport,stormy?: false}

    describe("#land") do
      it{is_expected.to respond_to(:land).with(1).argument}
      it{expect{subject.land airport}.not_to raise_error}
      context "has landed without erroring" do
        before(:each) do
          subject.land airport
        end
        it {is_expected.to be_landed}
        it "should be landed at the aiport it was asked to land at" do
          expect(subject.airport).to eq airport
        end
      end
    end

    describe("#take_off") do
      it{is_expected.to respond_to :take_off}
      it{expect{subject.take_off}.to raise_error "plane already in the air!"}
    end
    describe("#landed?") do
    end

    describe("#landed?") do
      it{is_expected.to respond_to :landed?}
      it{is_expected.not_to be_landed}
    end

  end
end
