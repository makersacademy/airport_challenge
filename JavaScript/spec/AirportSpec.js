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
    })
})