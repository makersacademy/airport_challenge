require "Airport"
describe Airport do

    # Check plane resposds to land method
    it "responds to land method" do
        expect(subject).to respond_to(:land).with(1).argument
    end

    # Test, instruct a plane to take off
    it "responds to take_off method" do
        expect(subject).to respond_to(:take_off).with(1).argument
    end

    # Test confirm plane no longer in hanger
    it "Confirms plane is no longer in the hangar " do
        expect(subject.take_off).to eq("Plane not in hangar")
    end
end