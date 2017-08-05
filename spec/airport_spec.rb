require 'airport'

describe Airport do

  let(:aeroplane) { double :aeroplane }

  it "responds to full?" do

    # make sure airport responds to full?
    expect(subject).to respond_to(:full?)

  end

  it "responds to on_land" do

    # make sure airport responds to on land
    expect(subject).to respond_to(:on_land)

  end

  it "on_land adds plane to array" do

    # land a plane
    subject.on_land aeroplane

    # make sure airport knows it has landed and has it in array
    expect(subject.planes.include? aeroplane).to eq(true)

  end

  it "responds to on_take_off" do

    # make sure airport responds to on take off
    expect(subject).to respond_to(:on_take_off)

  end

  it "on_take_off removes plane from array" do

    # create a plane to make take off
    subject.planes = [aeroplane]

    # try to make the plane take off
    subject.on_take_off aeroplane

    # make sure plane is no langer at airport
    expect(subject.planes.include? aeroplane).to eq(false)

  end

  it "has a default integer capacity" do

    # create airport default capacity is an integer
    expect(Airport.new.capacity.class).to eq(Integer)

  end

  it "can define custom capacity" do

    # create airport with defined capacity and check it is as expected
    expect(Airport.new(10).capacity).to eq(10)

  end

  it "full? works correctly" do

    # create airport with defined capacity
    airport = Airport.new(5)

    # fill to capacity
    1.upto(5) do
      airport.planes << aeroplane
    end

    # make sure airport knows it's full
    expect(airport.full?).to eq(true)

  end

  it "can deal with high traffic (100 iterations)" do

    airport = Airport.new(10)
    expected = 0

    # 100 test iterations
    1.upto(100) do

      # action:
      # => 1 = land new plane
      # => 2 = take off
      action = rand(1..3)

      # if there are no landed planes, action is forced to 1
      if action == 1 || airport.planes.length.zero? then

        # create a plane
        plane = Aeroplane.new

        # try land it
        if plane.try_land airport then

          # keep note of number of planes we expect
          expected += 1
        end

      # action is 2, try make a random plane take off from airport
      elsif airport.planes[rand(airport.planes.length)].try_take_off then

        # keep note of number of planes we expect
        expected -= 1
      end

    end

    # check that the expected value matches number of landed planes in airport
    expect(airport.planes.length).to eq(expected)

  end

end
