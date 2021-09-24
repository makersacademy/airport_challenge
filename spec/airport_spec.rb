require "./lib/airport.rb"

describe Airport do
    it "plane to land" do
      subject.land("A380")
    expect(subject.show_register).to eq(["A380"])
    end
end