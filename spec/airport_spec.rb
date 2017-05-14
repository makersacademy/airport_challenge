require 'airport'

describe Airport do

  describe "#initialize" do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#plane_landed' do
  #   it "raises an error that planes are unable to land due to capacity being full" do
  #       subject.capacity.times { subject.plane_landed (Plane.new)}
  #       expect { subject.plane_landed Plane.new }.to raise_error "Airport is at full capacity"
  #       # to raise_error("No landing, airport is at full capacity")
  #   end
  # end
    it "raises an error when there is stormy weather, so that planes are unable to land" do
      if @random_weather == true
        expect {subject.plane_landed(plane)}.to raise_error("No landing, due to severe weather conditions")
      end
    end
      it "lets a plane land at an airport" do
        expect(subject).to respond_to(:plane_landed).with(1).argument
      end
      it "confirms that the plane has landed" do
        plane = subject.plane_landed(plane)
    expect(plane.landed?).to eq true    #### true
  end
end

  describe '#plane_take_off' do
    it "raises an error when there is stormy weather, so that the plane is unable to take off" do
      if @random_weather == true
        expect {subject.plane_take_off(plane)}.to raise_error("No taking off, due to severe weather conditions")
      end
    end
    it "allows a plane to take off" do
      expect(subject).to respond_to(:plane_take_off).with(1).argument
    end
    it "confirms the plane has taken off" do
      plane = subject.plane_take_off(plane)
        expect(plane.take_off?).to eq true
      end
    end




describe '#weather?' do
  it "will use a random number generator to set the weather" do
    if @random_weather == true
  it "raises an error that there is stormy weather, so that the plane is unable to take off" do
    expect(subject.plane_take_off).to raise_error("No taking off due to severe weather conditions")
    if @random_weather == true
  it "raises an error that there is stormy weather, so that the plane is unable to take off" do
    expect(subject.plane_take_off).to raise_error("No taking off due to severe weather conditions")
    end
    end
  end
    end
    if @random_weather == false
      it "confirms the plane has taken off" do
        plane = subject.plane_take_off(plane)
          expect(plane.take_off?).to eq true
        end
      if @random_weather == false
        it "confirms the plane has taken off" do
          plane = subject.plane_landed(plane)
            expect(plane.landed?).to eq true
        end
      end
    end
  end
end
end
