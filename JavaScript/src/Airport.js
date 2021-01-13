class Airport {
    constructor() {
        this.hangar = []
        this.capacity = 20
    }
    takeOff() {
        
    }
    land(plane) {
        return this.hangar.push(plane)
    }
}