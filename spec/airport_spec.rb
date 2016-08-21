require 'airport'
require 'weather_report_spec'
require 'plane'

describe Airport do
  include_examples "weather_report"

  subject {described_class.new}
  let(:plane) {double(:plane, :is_a? => true, :plane? => true)}


  it "can harbour planes" do
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it "only allows plane objects to be passed into methods" do
    expect{subject.in_airport(nil) ;
       subject.land(nil)}.to raise_error
        "pass in plane objects only"
  end

  it "has planes take off" do
    #allow(subject).to receive(:weather_report) {"sunny"}
    subject.take_off
    expect(subject.planes).not_to include plane
  end

  it "can check whether a plane is harboured" do
    subject.land(plane)
    expect(subject.in_airport?(plane)).to eq true
  end

  it "stops planes taking off when stormy" do
    allow(subject).to receive(:weather_report) {"stormy"}
    expect{subject.take_off}.to raise_error "stormy day, no flying"
  end


  it "only lets a plane harbour once" do
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error "plane already landed"
  end

  it "does not accept planes when full" do
      subject.capacity.times do
      plane = double(:holeycrap, :plane? => true)
      #we need to create new doubles otherwise
      #plane already landed is raised
      subject.land(plane) end
      expect{subject.land(plane) #try land more than capacity
    }.to raise_error "airport full, find another lol"
  end

  it "allows controller to override default capacity" do
    big_airport = Airport.new(40)
    expect(big_airport.capacity).to eq(40)
  end
end
