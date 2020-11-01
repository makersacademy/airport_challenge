require 'airport'

describe Airport do

  it "Allows the user to create an instance of Airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  describe "#land" do
    it 'responds to #land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'raises an error when full' do
      10.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport Full'
    end
  end

  describe "#take_off" do
    it 'responds to #take_off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end

end
