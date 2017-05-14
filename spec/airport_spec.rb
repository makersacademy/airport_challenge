require 'airport'

describe Airport do

  describe '#plane_landed' do
    it "lets a plane land at an airport" do
      expect(subject).to respond_to(:plane_landed).with(1).argument
    end
    it "confirms that the plane has landed" do
      plane = subject.plane_landed(plane)
      expect(plane.landed?).to eq true
    end
  end

  describe '#plane_take_off' do
    # it "raises an error when there weather conditions are bad" do
    #   expect{ subject.plane_take_off }.to raise_error("No taking off sever weather conditions")
    # end
    it "allows a plane to take off" do
      expect(subject).to respond_to :plane_take_off
    end
    it "confirms the plane has taken off" do
      plane = subject.plane_take_off
      expect(plane.take_off?).to eq true
    end
  end

  describe '#weather?' do
    it "will use a random number generator to set the weather" do
      plane = subject.weather?
      if plane == true
        expect(subject.plane_take_off).to raise_error("No taking off sever weather conditions")
      else
        expect(subject).to respond_to (:plane_take_off)
      end
    end
  end
end
