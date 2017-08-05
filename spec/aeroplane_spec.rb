require 'aeroplane'

describe Aeroplane do

  let(:airport) { double :airport }

  it "responds to in_airport?" do

    expect(subject).to respond_to(:in_airport?)

  end

  it "in_airport? returns a boolean" do

    expect([true, false].include? subject.in_airport?).to eq(true)

  end

  it "responds to try_land" do

    expect(subject).to respond_to(:try_land)

  end

  it "can land in sunny weather" do

    allow(airport).to receive_messages(
      :on_land => nil,
      :full? => false,
      :planes => []
    )

    expect(subject.try_land airport, $sunny).to eq(true)

  end

  it "can not land when airport is full" do

    allow(airport).to receive_messages(
      :full? => true,
    )

    expect(subject.try_land airport, $sunny).to eq(false)

  end

  it "can not land in stormy weather" do

    allow(airport).to receive_messages(
      :full? => false,
    )

    expect(subject.try_land airport, $stormy).to eq(false)

  end

  it "responds to try_take_off" do

    expect(subject).to respond_to(:try_take_off)

  end

  it "can take off in sunny weather" do

    allow(airport).to receive_messages(
      :on_take_off => nil,
      :planes => [subject]
    )

    subject.airport = airport
    expect(subject.try_take_off $sunny).to eq(true)

  end

  it "can not take off in stormy weather" do

    expect(subject.try_take_off $stormy).to eq(false)

  end

end
