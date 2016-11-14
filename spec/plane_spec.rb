require 'plane'

describe Plane do
  it {is_expected.to be_instance_of(Plane)}
  context "@state" do
    it "has a default state of :flying" do
      expect(subject.state).to eq :flying
    end

    it "can change state to 'landed'" do
      subject.state = :landed
      expect(subject.state).to eq :landed
    end
  end
end
