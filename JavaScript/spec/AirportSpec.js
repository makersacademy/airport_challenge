describe("Airport", () => {
    describe("constructor", () => {
        var airport = new Airport()
        it("responds to hangar", () => {
            expect(airport.hangar).toBeDefined();
        })
        it("hangar is empty when starts", () => {
            expect(airport.hangar).toEqual([]);
        })
        it("responds to capacity", () => {
            expect(airport.capacity).toBeDefined();
        })
        it("sets a default capacity", () => {
            expect(airport.capacity).toEqual(20);
        })
        it("responds to takeOff", () => {
            expect(airport.takeOff).toBeDefined();
        })
        it("responds to land", () => {
            expect(airport.land).toBeDefined();
        })
    })

})