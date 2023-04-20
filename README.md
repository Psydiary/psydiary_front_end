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
  <a href="https://github.com/Bobsters986/psydiary_back_end">
  <img src="https://user-images.githubusercontent.com/114954379/233474790-52cd8128-529d-4574-a4e4-696039fc8719.png"
  </a>
  


  <h3 align="center">🍄 Psydiary—The App to Bring You Home 🍄</h3>

  <p align="center">
    An app to track your psilocybin microdosing protocol with everything from daily mood tracking and microdose experience logs to AI generated journal prompts.
    <br />
  </p>
</div>




<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



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

![Screen Shot 2023-04-20 at 1 24 27 PM](https://user-images.githubusercontent.com/116821829/233442087-cea5421d-4098-4452-a937-d62d04d5fdcf.png)

### Built With

To build this web application, our team utilized;

* Ruby 3.1.1
* Rails 7.0.4.3
* PostgreSQL
* Bootstrap
* Heroku

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

1. NEEDS OUR API KEY EXAMPLES. Get a free API Key at [https://example.com](https://example.com)
2. Clone this Repository
   ```
    git clone https://github.com/torieynart/psydiary_front_end
    git clone https://github.com/Bobsters986/psydiary_back_end
   ```
3. In your terminal, run the following commands;
    ```sh
    bundle install
    bundle exec figaro install
    rails db:{drop,create,migrate,seed}
    ```
4. Enter your API in `application.yml`
   ```ruby
   API_KEY = 'ENTER YOUR API';
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [x] Add README
- [x] Add Root Page
- [x] Add Learn More Page
- [x] Add New User Page
- [x] Add User Login
- [x] User Dashboard
- [x] Protocol Show Page
- [x] User Edit Page
- [x] New Daily Log
- [x] New Microdose Diary
- [x] Daily Log/Microdose Index
- [x] Daily Log Show Page
- [x] Dose Show Page
- [x] Resources/Discover Page

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

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

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

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
