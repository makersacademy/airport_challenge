require "plane"

describe Plane do

  let(:passenger) { double(:passenger, checked_in?: true) }

  before { allow(passenger).to receive(:check_in) { passenger } }

  it "has an airborne status when created" do
    expect(subject).to respond_to :airborne?
  end

  it "can take off" do
    expect(subject.take_off).to be_airborne
  end

  it "can land" do
    expect(subject.land).not_to be_airborne
  end

  it "has an adjustable number of seats" do
    random_seating = rand(50..100)
    plane = Plane.new(capacity: random_seating)
    expect(plane.capacity). to eq random_seating
  end

  it "can seat a passenger" do
    subject.board(passenger)
    expect(subject.seats).to include(passenger)
  end

  it "checks a passenger in on boarding" do
    subject.board(passenger)
    expect(subject.seats.last).to be_checked_in
  end

  it "does not let passenger board when full" do
    subject.capacity.times { subject.board(passenger) }
    expect { subject.board(passenger) }.to raise_error "Plane Full"
  end
end
