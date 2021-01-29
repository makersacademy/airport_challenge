# Airport Challenge

## Credits to my solution
Used advice of peer group 1! (Anna (yy140), Graeme and Anastasia)

## User Stories  

### Story 1
* As an air **traffic controller** 
* So I can get **passengers** to a destination 
* I want to instruct a **plane** to _land_ at an **airport**  

|Objects            |Messages     |
|-------------------|-------------|
|traffic controller |             |
|passenger          |             |
|plane              |             |
|airport            |`land_plane` |

### Story 2
* As an air **traffic controller** 
* So I can get **passengers** on the way to their destination 
* I want to instruct a **plane** to _take off_ from an **airport** and _confirm_ that it is no longer in the **airport**  

|Objects            |Messages         |
|-------------------|-----------------|
|traffic controller |                 |
|passenger          |                 |
|airport            |`take_off_plane` |
|plane              |`confirm_status` |

### Story 3
* As an air **traffic controller** 
* To ensure safety 
* I want to _prevent landing_ when the **airport** is _full_  

|Objects            |Messages         |
|-------------------|-----------------|
|traffic controller |                 |
|passenger          |                 |
|airport            |`full?`          |
|plane              |                 |

### Story 4
* As the system designer
* So that the software can be used for many different **airport**s
* I would like a default **airport** capacity that can be _overridden_ as appropriate  

|Objects            |Messages                                |
|-------------------|----------------------------------------|
|traffic controller |                                        |
|passenger          |                                        |
|airport            |`initialize` (with alternative capacity)|
|plane              |                                        |

* As an air **traffic controller** 
* To ensure safety 
* I want to prevent takeoff when weather is stormy  

|Objects            |Messages    |
|-------------------|------------|
|traffic controller |            |
|passenger          |            |
|airport            |`stormy?`   |
|plane              |            |

* As an air **traffic controller** 
* To ensure safety 
* I want to prevent landing when weather is stormy  

|Objects            |Messages    |
|-------------------|------------|
|traffic controller |            |
|passenger          |            |
|airport            |`stormy?`   |
|plane              |            |

|A 'normal' process       |
|:-----------------------:|
|_air traffic controller_ |
|'land plane'             |
|**airport**              |
|`land_plane`             |
|**plane**                |
|`confirm_status`         |
|_air traffic controller_ |