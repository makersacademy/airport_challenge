require_relative '../lib/airport.rb'

describe Airport do
  let(:airplane) {Airplane.new}

  describe "#land"
  it { is_expected.to respond_to(:land).with(1).argument }

  it "should not allow an airplane to land while airport is full" do
    10.times do  # 10 airplanes landed
      subject.land(airplane)
    end
    expect {subject.land(:airplane).to raisue_error ("Cannot land airplane due to airport being full")}
  end

  describe "#take_off"
  it { is_expected.to respond_to(:take_off).with(1).argument }
end