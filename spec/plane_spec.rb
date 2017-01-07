require "plane"
describe Plane do

  context "in the air and good weather" do
    let(:airport) {double :nice_airport, stormy?: false,take_off_request: "granted",full?: false}

    describe("#land") do
      context "has landed" do
        before(:each) do
          subject.land airport
        end
        it {is_expected.to be_landed}
        it "should be landed at the aiport it was asked to land at" do
          expect(subject.airport).to eq airport
        end
      end
      it "should not land at a full airport" do
        allow(airport).to receive(:full?).and_return(:true)
        expect{subject.land airport}.to raise_error "that airport is full!"
      end
    end

    describe("#take_off") do
      it{expect{subject.take_off}.to raise_error "plane already in the air!"}
    end

    describe("#stormy?") do
      it{expect{subject.stormy?}.to raise_error "plane location unknown!"}
      it{expect(subject.stormy? airport).to eq false}
    end

    describe("#landed?") do
      it{is_expected.not_to be_landed}
    end

  end

  context "in the air and bad weather" do
    let(:airport) {double :bad_airport,stormy?: true,full?: false}

    describe("#land") do
      it{expect{subject.land airport}.to raise_error "can't land in storm"}
    end

    describe("#take_off") do
      it{expect{subject.take_off}.to raise_error "plane already in the air!"}
    end

    describe("#stormy?") do
      it{expect{subject.stormy?}.to raise_error "plane location unknown!"}
      it{expect(subject.stormy? airport).to eq true}
    end

    describe("#landed?") do
      it{is_expected.not_to be_landed}
    end

  end

  context "on the ground in good weather" do
    let(:airport)       {double :nice_airport,stormy?: false,full?: false}
    let(:other_airport) {double :bad_airport ,stormy?: false,full?: false}
    before(:each) do
      subject.instance_variable_set(:@landed, true)
      subject.instance_variable_set(:@airport, airport)
    end

    describe("#land") do
      message = "can't land if already landed"
      it{expect{subject.land airport}.to raise_error message}
    end

    describe("#take_off") do
      message = "plane not at that airport!"
      it{expect{subject.take_off other_airport}.to raise_error message}
      context "has taken off" do
        before(:each) do
          subject.take_off
        end
        it{is_expected.not_to be_landed}
        it{expect(subject.airport).to eq nil}
      end
    end

    describe("#stormy?") do
      it{expect(subject.stormy?).to eq false}
    end

    describe("#landed?") do
      it{is_expected.to be_landed}
    end

  end

  context "on the ground in bad weather" do
    let(:airport) {double :bad_airport,stormy?: true,full?: false}
    before(:each) do
      subject.instance_variable_set(:@landed, true)
      subject.instance_variable_set(:@airport, airport)
    end

    describe("#land") do
      message = "can't land if already landed"
      it{expect{subject.land airport}.to raise_error message}
    end

    describe("#take_off") do
      it{expect{subject.take_off}.to raise_error "can't take off in storm!"}
    end

    describe("#stormy?") do
      it{expect(subject.stormy?).to eq true}
    end

    describe("#landed?") do
      it{is_expected.to be_landed}
    end
  end
end
