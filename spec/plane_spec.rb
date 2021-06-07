require './lib/plane.rb'

describe Plane do

    let(:weather) {double :weather, :sunny= => true, sunny?: true}
    let(:weather2) {double :weather, :sunny= => false, sunny?: false}

    it "Check to see if a new plane is in the group" do
        expect(subject.landed).to eq true
    end

    it { is_expected.to respond_to :sunny }

    it "Check weather = sunny" do
        expect(weather).to be_sunny
    end

    it "Check weather != sunny" do
        allow(weather2).to receive(:sunny).and_return(false)
        expect(weather2).to_not be_sunny
    end

end