# transit-safety-app

This is a working app prototype designed to combat the problem of crowding on New York city subways during the COVID 19 crisis. This app was part of the 2020 Columbia University Mass Transit engineering design challenge.
This app is meant to be a demo to present proposed functionalities. 

**Guide to Final Deliverables-Team 7 Contents**

iOS App Code folder
Contains all the Swift iOS app code, can be run by anyone with XCode. We are working on publish to app store, or publishing ad hoc.


**R scripts used to generate turnstile associated graphs**
This is the code that generates the graphs associated with the “See historical station density button” in our app
![alt text](https://github.com/shannonjin/transit-safety-app/blob/master/Screen%20Shot%202020-08-10%20at%209.38.45%20PM.png)

**MTA Turnstile Analysis and Dijkstra’s Algorithim***
Contains all the python code used to generate the safest path between a start subway station and a destination subway station. The safest path is the path with historically the least people. This is the code that drives our app’s mapping feature. 

When a user types in a start address and an end address in our app, we intend to use our Dijkstra’s algorithm to generate and display a suggested subway route: a route with the least number of people historically. 

![alt text] (https://github.com/shannonjin/transit-safety-app/blob/master/Screen%20Shot%202020-08-10%20at%209.44.11%20PM.png)
