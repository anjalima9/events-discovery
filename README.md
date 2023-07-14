# Events Discovery

Bienvenue dans Events Discovery ! Cette application vous permet de découvrir et participer à des évènements organisés par d'autres utilisateurs. Vous avez également la possibilité de créer vos propres évènements.

**Framework used**: Ruby on Rails

**Database**: Mysql

## Prerequisites
The following tools need to be installed:
- Ruby [3.2.2]
- Rails [7.0.4.3]

## Setup
1. Clone this repository to your local machine:
```
git clone https://github.com/anjalima9/events-discovery.git
```
2. Navigate to the project directory:
```
cd events-discovery
```
3. Install the Ruby dependencies specified in the Gemfile:
```
bundle install
```
4.Create the database and run the migrations:
```
rails db:create
rails db:migrate
```
5.Install css and javascript:
```
rails css:install:bootstrap
rails javascript:install:bootstrap
```
6. Apply css and javascript:
```
rails assets:precompile
```
7. Launch the development server:
   ```
   rails server
   ```
8. Access the application in your browser at http://localhost:3000.

## Utilisation
Once the app is installed and running, you can follow these steps to use it:

1. Create a user account by providing your name, email address and a password.
2. Browse the events available on the home page. You can view the details of each event, including the date, location, and a description.
3. To participate in an event, click on the "Register" button. Your participation will be recorded and you will receive notifications about the event.
4. If you want to create your own event, click on the "Create an event" button and fill in the necessary information, such as title, date, location and description.
5. You can also update or delete your existing events by accessing the "My Events" page in your user profile.

## Contributor
[Mario](https://github.com/manzcode)

## Contact
For any questions, suggestions, or bug reports, please contact us at: andrianatoandro.anja@gmail.com .

We hope you enjoy using Events Discovery!

Thanks for using our app!

