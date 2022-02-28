describe Airport do
    describe .land do
        it "allowes an airplane to land at the airport" do
            Airport.new
            allow(Airport).to recieve(:rand)
        end
    end

    describe .takeoff do
        it "allowes an airplane to takeoff from the airport" do
            Airport.new
            allow(Airport).to recieve(:rand)
        end
    end
end