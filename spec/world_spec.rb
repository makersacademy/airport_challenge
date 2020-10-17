require 'class_world'

# this test module is intended to test the world class (scenarios)

# clear world level classes

RSpec.describe World do
  it "- confirm scenario_setup mode indicator present" do
    Plane.clear_all_planes
    Airport.clear_all_airports

    expect(subject.scenario_setup?).to be_truthy
  end
  it "- confirms that there is a default number of objects on initialisation" do

    expect(subject.airports).to be_an_instance_of(Integer)
    expect(subject.airports).to eq(World::DEFAULT_AIRPORTS)
    expect(subject.planes).to be_an_instance_of(Integer)
    expect(subject.planes).to eq(World::DEFAULT_PLANES)
  end

  it "- confirms that the default scenario method exists" do
    expect(subject).to respond_to(:default)
  end

  it "- confirms that the default scenario runs" do
    subject.default
    expect(subject.airports).to be_an_instance_of(Array)
    expect(subject.airports.count).to eq(World::DEFAULT_AIRPORTS)
    expect(subject.planes).to be_an_instance_of(Array)
    expect(subject.planes.count).to eq(World::DEFAULT_PLANES)
  end

  it "- enable change of default object count prior to scenario build" do
    Plane.clear_all_planes
    Airport.clear_all_airports

    expect(subject.scenario_setup?).to be_truthy
    expect{subject.airports = 15}.to change(subject, :airports).to(15)
    expect{subject.planes = 12}.to change(subject, :planes).to(12)
  end

  it "- doesn't allow number of world airports to change after scenario has run" do
    subject.default if subject.airports.class == Integer

    expect{ subject.airports = 16 }.to output("World scenario created" +
        " - use 'controller software' to change airports\n").to_stdout
  end

  it "- doesn't allow number of world planes to change after scenario has run" do
    subject.default if subject.planes.class == Integer

    expect{ subject.planes = 16 }.to output("World scenario created" +
        " - use 'controller software' to change planes\n").to_stdout
  end

end
