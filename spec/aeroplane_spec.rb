require 'aeroplane'

describe Aeroplane do

  let(:airport) { double :airport }

  it "responds to in_airport?" do

    # make sure aeroplane responds to in airport?
    expect(subject).to respond_to(:in_airport?)

  end

  it "in_airport? returns a boolean" do

    # make sure in airport? returns true or false
    expect([true, false].include? subject.in_airport?).to eq(true)

  end

  it "responds to try_land" do

    # make sure aeroplane responds to try land
    expect(subject).to respond_to(:try_land)

  end

  it "can land in sunny weather" do

    # create a situation where landing should be possible
    allow(airport).to receive_messages(
      :on_land => nil,
      :full? => false,
      :planes => []
    )

    # make sure plane landed
    expect(subject.try_land airport, $sunny).to eq(true)

  end

  it "can not land if already landed" do

    # create a situation where landing should be possible
    allow(airport).to receive_messages(
      :on_land => nil,
      :full? => false,
      :planes => []
    )
    subject.try_land airport, $sunny

    # make sure plane did not land
    expect(subject.try_land airport, $sunny).to eq(false)

  end

  it "can not land when airport is full" do

    # create a situation where landing should not be possible
    allow(airport).to receive_messages(
      :full? => true,
    )

    # make sure plane did not land
    expect(subject.try_land airport, $sunny).to eq(false)

  end

  it "can not land in stormy weather" do

    # create a situation where landing should not be possible
    allow(airport).to receive_messages(
      :full? => false,
    )

    # make sure plane did not land
    expect(subject.try_land airport, $stormy).to eq(false)

  end

  it "responds to try_take_off" do

    # make sure aeroplane responds to try take off
    expect(subject).to respond_to(:try_take_off)

  end

  it "can take off in sunny weather" do

    # create a situation where landing should be possible
    allow(airport).to receive_messages(
      :on_take_off => nil,
      :planes => [subject]
    )
    subject.airport = airport

    # make sure plane landed
    expect(subject.try_take_off $sunny).to eq(true)

  end

  it "can not take off in stormy weather" do

    # make sure plane can't take of in a storm
    expect(subject.try_take_off $stormy).to eq(false)

  end

end
