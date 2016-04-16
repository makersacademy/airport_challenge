require 'airport'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}
  it {is_expected.to respond_to(:weather_report)}

  let(:plane) {double :plane, land: nil, take_off: nil}



  describe "#land" do
    it "plane will recieve a call to land" do
      expect(plane).to receive(:land)
      subject.land(plane)
    end

    it 'confirms that a plane has landed' do
      expect(subject.land(plane)).to eq "That was a bumpy landing sir"
    end
  end

  describe "#take_off" do
    it "plane will recieve a call to take_off" do
      expect(plane).to receive(:take_off)
      subject.take_off(plane)
    end

    it 'confirms that a plane has left the airport' do
      expect(subject.take_off(plane)).to eq "Don't forget to send a postcard"
    end
  end

  describe '#weather_report' do

    # it 'reports "glorious sun shine" when the weather is good' do
    #   expect(subject.weather_report).to eq 'glorious sun shine'
    # end
    #
    # it 'reports "bleak" when the weather is bad' do
    #   expect(subject.weather_report).to eq 'bleak'
    # end
  end

end
