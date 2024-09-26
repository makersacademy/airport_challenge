require "./lib/airport.rb"

describe Airport do
    it "plane to land" do
      subject.land("A380")
    expect(subject.show_register).to eq(["A380"])
    end

    it "plane to take off" do
      subject.land("A380")
      subject.take_off("A380")
      expect(subject.show_register).to eq([])
    end

    it "error message if plane not in the airpot" do
      expect(subject.take_off("A380")).to eq("Error! Airplane not at the aiport!!")
    end

    it "airport full" do
     3.times {subject.land("A380")}
     expect(subject.land("A380")).to eq("The airport is full!!")
    end
end