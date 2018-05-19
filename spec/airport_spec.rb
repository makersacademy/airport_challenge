require 'airport'

describe Airport do
  context '#land' do
    it { is_expected.to respond_to(:land) }
    it "prevents landing when airport is full" do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error
      "Captain, you cannot land at this airport as it is full"
    end
  end
  # test the 'take off plane method is responding'
  context '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it "takes a plane out of the airport" do
      expect(subject.take_off).to eq 
    end
    end
    # context '#taken_off?' do
    #   it "confirms plane is no longer in the airport" do
    #     expect(subject.taken_off?).to eq
    #     true
    #   end
    # end
  context ''


end

# require_relative './lib/airport.rb'
