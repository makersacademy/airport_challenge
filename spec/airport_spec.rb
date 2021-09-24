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

    it "plane to take off message" do
        subject.land("A380")
        subject.take_off("A380")
        expect(subject.take_off("A380")).to eq(puts "The A380 left the airport")
      end
    it "error message if plane not in the airpot" do
      expect(subject.take_off("A380")).to eq(puts "Error! Airplane not at the aiport!!")
    end

end