## Airport challenge

This project is a system to allow an air traffic controller to monitor planes
and let them safely land or takeoff from an aiport.

### How to run 

To run use in irb. Instantiate Airports with a name and capacity (default capacity is 10)
and then instantiate Planes.
Below is a table of the classes and their respective methods with their descriptions.
After instantiating a plane call the land method to land it in an airport first,
then takeoff can be called.

| Objects       | Methods        | Description |
| ------------- | -------------- | ----------- |
| Plane | locate_plane | locates the plane
| Airport(name, capacity = 10) | land | land the plane in the airport |
|         | takeoff | let the plane takeoff from the airport it's in |
