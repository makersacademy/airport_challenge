require 'airport'
require 'weather_spec'

describe Airport do
  include_examples "weather"

  subject {described_class.new}
  let(:plane) {double(:plane, :is_a? => true, :plane? => true)}

  context '#land' do
    it "can harbour planes" do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it "can check whether a plane is harboured" do
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end

    it "only lets a plane harbour once" do
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error "plane already landed"
    end
  end

  it "has planes take off" do
    subject.take_off
    expect(subject.planes).not_to include plane
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
