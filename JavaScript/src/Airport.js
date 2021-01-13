class Airport {
    constructor() {
        this.hangar = []
        this.capacity = 19
    }
    takeOff() {
        
    }
    land(plane) {
        if (this.hangar.length <= this.capacity) {
           return this.hangar.push("plane")
        }
    }
}