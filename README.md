<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://psydiary-app-1dfc3c05be70.herokuapp.com">
  <img src="https://user-images.githubusercontent.com/114954379/233474790-52cd8128-529d-4574-a4e4-696039fc8719.png"
  </a>
  
  [Visit Psydiary](https://psydiary-app-1dfc3c05be70.herokuapp.com)

  <h3 align="center">🍄 Psydiary—The App to Bring You Home 🍄</h3>

  <p align="center">
    An app to track your psilocybin microdosing protocol with everything from daily mood tracking and microdose experience logs to AI generated journal prompts.
    <br />
  </p>
</div>

<div align="center">
  <b>To interact with the deployed version of Psydiary, please check out the "How to View Psydiary on the Web" Section</b>
</div>
<br>


## About The Project

<div align="center">
  <img src="https://user-images.githubusercontent.com/114954379/233473470-bd339e5b-65dd-4b94-919b-8efbdf8c2e86.png"
 </a>
 </div>


Psydiary is a web application for users to track and journal their experiences with microdosing psychedelic mushrooms. The self reflection and data a user gathers on themselves is crucial to their journey. It will help them know what's working, if it’s time to change the frequency of their microdosing routine, or if they need a break from microdosing altogether. Users can document the following daily metrics;

* Mood
* Sleep Quality
* Anxiety Score
* Depression Score
* Energy Levels
* Sociability
* Meditation Time
* Exercise Type

![Screen Shot 2023-04-20 at 2 12 20 PM](https://user-images.githubusercontent.com/114954379/233477606-a749b24b-7d9c-4319-b7a1-60a2ac6b909f.png)

Users can also gain insight from their microdose protocols and journal their experience through tracking;
* Dosage
* Time Taken
* Mood Before and After
* Environment
* Sociability
* Journal Response to an AI Generated Prompt

![Screen Shot 2023-04-20 at 2 12 41 PM](https://user-images.githubusercontent.com/114954379/233477629-f91afc94-14f0-41e7-af7b-6a653b33097a.png)

Psydiary hopes to provide a structured way for users to track their experience with self-guided-treatment.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### PsyDiary Schema

![Screen Shot 2023-04-20 at 1 27 01 PM](https://user-images.githubusercontent.com/116821829/233442603-3074699a-736c-4971-b77d-60e6b42501c6.png)


### PsyDiary Design

For our service architecture we decided to split our front end from our backend. The diagram below shows the way in which our services interact. For the backend repo, click the link below.

[Backend Repo](https://github.com/Psydiary/psydiary_back_end)

![Screen Shot 2023-04-20 at 1 24 27 PM](https://user-images.githubusercontent.com/116821829/233442087-cea5421d-4098-4452-a937-d62d04d5fdcf.png)

### Built With

To build this web application, our team utilized;

* Ruby 3.1.1
* Rails 7.0.4.3
* PostgreSQL
* Bootstrap
* Heroku
* New Relic
* Google OAuth
* IPGeoLocation API

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Getting Started
<!-- can change this later or add more detail -->

### Prerequisites

* Ruby
  ```sh
  Ruby 3.1.1
  ```

* Rails
  ```sh
  Rails 7.0.4.3
  ```

### Installation

_Follow the steps below to install and set up this app._

1. Sign up for an [API Key](https://platform.openai.com/account/api-keys) through OpenAI

2. Sign up for a [Google developer account](https://console.cloud.google.com/apis).
  * make sure to use the callback URL: https://secure-crag-03925.herokuapp.com/auth/google_oauth2/callback

3. Clone this Repository
   ```
    git clone https://github.com/Psydiary/psydiary_front_end
    git clone https://github.com/Psydiary/psydiary_back_end
   ```
4. In your terminal, run the following commands;
    ```sh
    bundle install
    bundle exec figaro install
    rails db:{drop,create,migrate,seed}
    ```
5. Enter your API Keys in `application.yml`
   
   ```
    openai_key: 'your key here'
    GOOGLE_CLIENT_ID: 'your id here'
    GOOGLE_CLIENT_SECRET: 'your secret here'
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How to View Psydiary on the Web

_Follow the steps below to log in and explore Psydiary as a sample user

1. Navigate to the [Psydiary webpage](https://psydiary-app-1dfc3c05be70.herokuapp.com)

2. Login as our example user-
* username: janedoe@example.com
* password: 1234

3. Poke around Jane's dashboard to see the ways she can and has been interacting with Psydiary!


NOTE: If you would like to try Psydiary by creating your own account, you must be located in one of the states where Psilocybin is currently legal (Colorado, California, or Oregon). The app is currently set up to restrict user access in states where Psilocybin is illegal!
THe test user we have created should allow you to explore the use of the app regardless of the state you are accessing the web from!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap
To keep track of our progress while creating Psydiary, bugs that popped up, potential refactor ideas, and more... we utilized a [Notion Project Management Board](https://alluring-phlox-b74.notion.site/72a9807f1fec4b40a63d0fc8908cb7e8?v=aec33fee246f41b5bf8e7ae6ea7f9796) from Day 1.

We also used tools like Miro to diagram our database and service structure and Figma to create our wireframes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

### PsyDiary Team

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/torienyart"></td>
    <td><img src="https://avatars.githubusercontent.com/Bobsters986"></td>
    <td><img src="https://avatars.githubusercontent.com/4D-Coder"></td>
    <td><img src="https://avatars.githubusercontent.com/davejm8"></td>
    <td><img src="https://avatars.githubusercontent.com/sgwalker327"></td>
    <td><img src="https://avatars.githubusercontent.com/abdulredd"></td>
  </tr>
  <tr>
    <td>Tori Enyart</td>
    <td>Bobby Luly</td>
    <td>Antonio King Hunt</td>
    <td>David Marino</td>
    <td>Sam Walker</td>
    <td>Abdul Redd<br>Project Manager</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/torienyart">GitHub</a><br>
      <a href="https://www.linkedin.com/in/victoria-enyart-595052155/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Bobsters986">GitHub</a><br>
      <a href="https://www.linkedin.com/in/bobbyy-luly-217653260/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/4D-Coder">GitHub</a><br>
      <a href="https://www.linkedin.com/in/antoniokinghunt/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/davejm8">GitHub</a><br>
      <a href="https://www.linkedin.com/in/davidjmarino8/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/sgwalker327">GitHub</a><br>
      <a href="https://www.linkedin.com/in/sam-walker-95a49630/">LinkedIn</a>
    </td>
     <td>
      <a href="https://github.com/abdulredd">GitHub</a><br>
      <a href="https://www.linkedin.com/in/abdulredd/">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
