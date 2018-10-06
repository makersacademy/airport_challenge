require 'airport'
require 'pry'

describe Airport do
  let(:plane) { double(:plane) }
  let(:plane_2) { double(:plane) }

  def sunny_weather
    allow(subject).to receive(:check_weather) { "sunny" }
  end

  describe "#land" do
    it "should be able to land a plane" do
      sunny_weather
      subject.land(plane)
      expect(subject.landed_planes).to eq [plane]
    end

    it "should not land a plane if the weather is stormy" do
      allow(subject).to receive(:check_weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Stormy weather, cannot land."
    end

    it "should not land a plane that is already in the airport" do
      sunny_weather
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Plane already in the airport."
    end
  end

  it "should be able to display a landed plane" do
    sunny_weather
    subject.land(plane)
    expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane]}"
  end

  describe "#take_off" do
    it "should be able to instruct a plane to take off" do
      sunny_weather
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).to eq []
    end

    it "should raise an error if the specified plane is not in the airport" do
      sunny_weather
      subject.land(plane)
      expect { subject.take_off(plane_2) }.to raise_error "Plane is not in the airport!"
    end

    it "should not let a plane take off if the weather is stormy" do
      sunny_weather
      subject.land(plane)
      allow(subject).to receive(:check_weather) { "stormy" }
      expect { subject.take_off(plane) }.to raise_error "Stormy weather, cannot take off."
    end
  end

  it "should be able to confirm that a taken off plane is no longer in the hangar" do
    sunny_weather
    subject.land(plane)
    subject.land(plane_2)
    subject.take_off(plane)
    expect(subject.hangar_report).to eq "Planes currently in the airport: #{[plane_2]}"
  end

  describe "#check_weather" do
    it "should be either 'sunny' or 'stormy'" do
      expect(subject.check_weather).to eq('sunny').or eq('stormy')
    end
  end

end
