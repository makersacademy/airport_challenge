require 'airport'
require 'plane'

describe Airport do

  it 'responds to land plane' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

    it "raises an error when full" do
      @planes = []
      unless @planes.size != @capacity
        expect { subject.land(plane) }.to raise_error "Full Runway - Plane cannot land"
      end
  end

  it "allows planes to take off" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end



end
