require 'airport'

describe Airport do

  let(:aeroplane) { double :aeroplane }

  it "responds to full?" do

    expect(subject).to respond_to(:full?)

  end

  it "responds to on_land" do

    expect(subject).to respond_to(:on_land)

  end

  it "on_land adds plane to array" do

    subject.on_land aeroplane
    expect(subject.planes.include? aeroplane).to eq(true)
    puts subject.planes

  end

  it "responds to on_take_off" do

    expect(subject).to respond_to(:on_take_off)

  end

  it "on_take_off removes plane from array" do

    subject.planes = [aeroplane]

    subject.on_take_off aeroplane
    expect(subject.planes.include? aeroplane).to eq(false)

  end

  it "has a default integer capacity" do

    expect(Airport.new.capacity.class).to eq(Integer)

  end

  it "can define custom capacity" do

    expect(Airport.new(10).capacity).to eq(10)

  end

  it "full? works correctly" do

    airport = Airport.new(5)

    1.upto(5) do
      airport.planes << aeroplane
    end

    expect(airport.full?).to eq(true)

  end

  it "can deal with high traffic" do

    airport = Airport.new(10)
    expected = 0

    # 100 test iterations
    1.upto(100) do

      action = rand(1..3)

      if action == 1 || airport.planes.length == 0 then

        plane = Aeroplane.new

        if plane.try_land airport then
          expected += 1
        end

      elsif airport.planes[rand(airport.planes.length)].try_take_off then
        expected -= 1
      end

    end

    expect(airport.planes.length).to eq(expected)

  end

end
