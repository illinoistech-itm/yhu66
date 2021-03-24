# Sprint-02 Report

## Team Number Tuesday-team-02

Deepan Acharya - UI/UX & Junior Developer and Security
Teodora Nikolova - Project Manager
Mark Littlefield - Developer
Yixin Hu -  IT Operations

## UI/UX Report

UI/UX & Junior Developer and Security's job for Sprint-02 was to incorporate the created design scheme and ideas from Sprint-01 by collaborating closely with the Developer to work simultaneously and create the website design. For this sprint, the team entirely focused onto building the vagrant virtual environments and setting it up to run on each team member machine individually and have a working build on the team GitHub repository. The design was created using html, css and javascript. Bootstrap templates were also used which is a css front-end framework containing many interface components we would use for our design in the following sprints. A light color scheme with hues of green, blue, yellow colors complimenting each other were decided to be used as our main design due to their positive effect they will have on our end users.
The UI/UX & Junior Developer and Security also, made sure to test our code upon each deploy and reported any errors, issues which were resolved. All the features such as login, logout, navigating databases were tested as well and any misconfigurations were reported to the team. A non-admin and admin user's stories were created and followed closely to ensure they were working with the created website mysql databases. An authentication system, in our case a UFW firewall rule was implemented in our build-scripts/provisioner-scripts/post-install_mysql-install.sh script which is enabling automatically upon the boot of the machine creating a firewall.



## Developer Report

The Developer created all the skeleton pages using django framework and python to implement them into a working application. Several databases were created using MySql to hold users, passwords, posts, questions, answers and pictures into separate databases connected with each other through primary and secondary keys. For this sprint, the developer focused on getting the framework up and working displaying all pages, login in, login out and displaying different features depending on who the user was. Different views are displayed to admin, guest or any other user depending on their credentials.  
The Developer, also worked closely with the UI/UX by implementing the index.html and login style of the website. Additional features such as a search bar, views and posts were added to the website framework and are to be focused on in the coming sprints to make the user experience more friendly. All the code was pushed to our GitHub team repository, making collaboration easier for the team. The code, paths and variables, authentication mechanisms were than briefed and demonstrated to the team to avoid any confusion.


## IT Infrastructure Report

First of all, we decided to use Ubuntu Linux. Then we used Packer and Vagrant code provided in class to create and build the team members boxes, then all additional features such as pip, pillow, mySql, python3 were written in scripts and the machines were re-builded accordingly to reflect any updates. The created virtual machines were than configured to use user@localhost:8080 to open and access our website. From there we were able to ensure all databases, users have the correct privileges and if not were corrected accordingly. The index and login pages were than set up and a monolithic application was created which can be build on in the following sprints.


## Developer and Security Assumptions

For security, the team created and tested a  non-admin and admin user's stories to ensure they were safely authenticating the given user. An authentication system, in our case a UFW firewall rule was also implemented in our build-scripts/provisioner-scripts/post-install_mysql-install.sh script which is enabling automatically upon the boot of the machine creating a firewall. For this sprint, we used the UFW and build it in our Ubuntu machines. Only authenticated users with the correct privileges were given access to the MySql databases and if the user was not authenticated, they would not be able to see, navigate and use our database structures. Deployment GitHub keys were created and stored in each of our members team repositories which added an additional layer of security to our code. All the keys, scripts, variables and secrets were also stored in a .gitignore file ensuring that they would not be pushed or  accidentally shared to GitHub.

## User/Admin/Anonymous Story Goes here


![Admin can edit votes](/sprint-02/diagrams/django.png "votes")
![Admin can edit votes](/sprint-02/diagrams/search.png "votes")
![Admin can edit votes](/sprint-02/diagrams/trello1.png "votes")
![Admin can edit votes](/sprint-02/diagrams/trello2.png "votes")
![Admin can edit votes](/sprint-02/diagrams/website1.png "votes")

![Admin can edit votes](/sprint-02/diagrams/website2.png "votes")

![Admin can edit votes](/sprint-02/diagrams/website3.png "votes")

![Admin can edit votes](/sprint-02/diagrams/website4.png "votes")

![Admin can edit votes](/sprint-02/diagrams/website5.png "votes")

![Admin can edit votes](/sprint-02/diagrams/website6.png "votes")
![Admin can edit votes](/sprint-02/diagrams/website7.png "votes")






## Project Manager Report

The project manager were guiding their team to success and ensured all deliverables, milestones were met in the provided time frame. Any team concerns, questions were discussed and escalated when needed to the TA and the professor which ensured the team's productivity. The team used tools such as Slack, Trello, Google Drive, GitHub to communicate and collaborate between each other. Specific deadlines were set and Zoom meetings were initialized at least once per week.
A video presentation and a report were also created discussing the team's activities and accomplishments during Sprint-02.
