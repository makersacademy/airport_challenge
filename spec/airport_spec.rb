require 'airport'

describe Airport do
  context "#initialize" do
    airport = Airport.new
    plane = Plane.new
    it "sets capacity" do
      described_class::AIRPORT_CAPACITY.times do
        subject.land(plane)
      end
    end
  end

  context '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "prevents landing when airport is full" do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error "Cannot land at this airport as it is full"
    end
  end

  context '#take_off' do
    it "placeholder" do

    end
  end

end

  #   context '#take_off' do
  #     plane = Plane.new
  #     it { is_expected.to respond_to(:take_off) }
  #   end
  # end

# it "takes a plane out of the airport" do
#   expect(subject.take_off).to eq { plane.count }
# end

    # context '#taken_off?' do
    #   it "confirms plane is no longer in the airport" do
    #     expect(subject.taken_off?).to eq
    #     true
    #   end
    # end

# require_relative './lib/airport.rb'
