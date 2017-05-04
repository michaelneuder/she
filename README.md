# she
## Relationship simplified.

## Team:
Nischay Murthy, Executive Program Analyst (github: nmurthy9)  
Nick Zimmerer, Public Relations Representative (github: nzimm)  
Bum Kim, Quality Assurance Manager (github: bumshakabum)  
Alex Urbanski, Human Resources (github: aurbanski)  
Michael Neuder, Chief Visionary (github: michaelneuder)  

## Project title:
she

## Repo organization:
- the rails app is in the folder web_app/she_app. this is where all the active code lives. 
- to run the app locally, look below in the To Run section
- to test refrence the Testing.md file in the main directory. 

## Project description:
Do you ever get tired of being asked if you are still single? Are your parents
waiting anxiously for you to bring someone home? Are your friends pestering 
you to find someone? Then she is the app for you! This mobile and web app will
simulate a girlfriend by creating fake social media accounts for our users.
The user will recieve photos, texts, phone calls, snapchats, etc. from this
virtual girlfriend. A trick so convincing everyone will believe that she is
real. Take it one step farther and become a premium member to request in
person appearances at family events or parties, where other users will pretend
to be your significant other. Who knows, maybe you will find a connection!

## Vision statement:
1) The freedom of being single, with the social status of being taken.  
2) To give users the appearance of having a significant other, and provide
companionship to them.  

## Motivation: for working on this particular project (Why would you develop this?)
Provide the illusion of a girlfriend without requiring any real-life interaction

## Risks: to project completion
* Most of the team is new to app and web development
* A scope of a mobile app and a web app could be too broad
* With 5 collaboraters, communication may prove to be difficult
* Syncronization of multiple design vectors will be crutial to success

## Mitigation strategy for dealing with the risk
* Sharing knowledge as we learn will accelerate the learning curve
* Frequent communication will assist in project synchronization
* Taking advantage of pre-existing tools and technology will improve our
  coordination

## List of requirements: for the project
Story #1: "As a lonely man, I want some interaction no matter how fake." (10 pts)

Story #2: "As a parent I want to see my son posting pictures with his
girlfriend." (60 pts - requires doctoring pictures to seem real)

Story #3: "As a son, I want my parents to think I have a girlfriend." (5 pts -
behavior to fool parents)

Story #4: "As a 20-something, I want to impress my friends with the fact that I
have a girlfriend." (10 pts - belivable history on social media)

Story #5: "As I prankster, I want to make my friends think that someone is
interested in them online." (20 pts - automated, lifelike contact)

Story #6: "As a busy student, I want it to appear like I have a girlfriend on
social media, while still focusing on my schoolwork." (20 pts)

Story #7: "As a child, I want to bring someone to a family gathering to fool my
parents into thinking I am socially competent." (60pts - set up a platform to
support pairing people who want free food with someone who needs a temporary
'significant other.')

# Methodology
We plan on following a mix of Agile and waterfall, so we can better focus on
developing particular skillsets and applying them to the project.

## Project Tracking software:
BaseCamp

https://3.basecamp.com/3670469/projects/2748839

## Project plan: created from your Project Tracking software. Copy-paste the
plan (or screenshot of) from your project tracking software into the repository

![plan pic](/images/plan.png)
Format: ![Alt Text](url)

## To Run
#### 1) Pull from github, just to make sure everything is up to date
#### 2) Go into she_app directory. This is the directory for the app
#### 3) Run this in the terminal in the she_app directory
```
$bundle install
```
#### this installs all of the dependencies for the web app
#### 4) In the terminal is she_app directory run
````
$bin/rails db:migrate
````
#### this will migrate the database locally so that the dynamic pages will work
#### 5) In the terminal, in the she_app directory, run
```
$bin/rails server
```
#### this will serve the page to localhost:3000

## Also Hosted on Heroku
[Hosted web app](https://blooming-temple-89141.herokuapp.com/)

## Twilio setup/info
* config/contacts has usernames and numbers

## Used Michael Hartl's rails tutorial heavily for reference.
[Rails Tutorial](https://www.railstutorial.org/)
