#### User story 1

* As an air traffic controller
* So I can get passengers to a destination
* I want to instruct a plane to land at an airport

**Nouns & Verbs**

| OBJECTS | MESSAGES |
|---------|----------|
|controller | |
|passengers | |
|plane | |
|airport| land |


Airport <-- land --> Plane

**Class Responsibility Collaborator**

<table>
  <tr>
    <td colspan="2"><b><center>Class</b></td>
  </tr>
  <tr>
    <td>Responsibilities: what a class<br>
    knows or does</td>
    <td>Collaborators: another class that<br>
    a class interacts with to fulfil its responsibilities
    </td>
  </tr>
  </center>
</table>

<br>

<table>
  <tr>
    <td colspan="2"><b><center>Airport</b></td>
  </tr>
  <tr>
    <td>land</td>
    <td>Plane</td>
  </tr>
  </center>
</table>
<br>

#### User story 2

* As an air traffic controller
* So I can get passengers on the way to their destination
* I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

**Nouns & Verbs**

| OBJECTS | MESSAGES |
|---------|----------|
|controller | |
|passengers | |
|plane | taken_off? ˜|
|airport| takeoff |

Airport <-- takeoff --> Plane

**Class Responsibility Collaborator**

<table>
  <tr>
    <td colspan="2"><b><center>Airport</b></td>
  </tr>
  <tr>
    <td>takeoff</td>
    <td>Plane</td>
  </tr>
  </center>
</table>
<br>
