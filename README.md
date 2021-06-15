![img](https://i.ibb.co/qDk84Ph/Screen-Shot-2021-06-15-at-5-19-35-PM.png)      
Application to plan road trips that allows users to see the current weather as well as the forecasted weather at the destination.    
This is a back-end repo that exposes APIs in order to be consumed by the front-end team to display to a user.

 
## Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Initial Setup
1. Fork the Project
2. Set up the rails database ```rails db:{create,migrate}```
3. Create ruby file to securely store API keys. We chose Figaro; for Figaro setup, refer below.
4. Add the following keys to your secured file:  
    *  *mapquest_key*   [request Mapquest API key](https://developer.mapquest.com/)     
    *  *openweather_key*     [request OpenWeather API key](https://openweathermap.org/api)     
    *  *flickr_key*     [request Flickr API key](https://www.flickr.com/services/api/)
5. Plan a trip!

## Endpoints:
#### 1a. Retrieve weather for a city    
##### Request:     
`GET /api/v1/forecast?location=denver,co`    
`Content-Type: application/json`   
`Accept: application/json`   

#### 1b. Background Image for the City      
##### Request:  
`GET /api/v1/backgrounds?location=denver,co`      
`Content-Type: application/json`      
`Accept: application/json`      

#### 2. User Registration     
##### Request:  
`POST /api/v1/users`     
`Content-Type: application/json`     
`Accept: application/json`     

`{`     
  `"email": "whatever@example.com",`     
  `"password": "password",`      
  `"password_confirmation": "password"`     
}`


#### 3. Login       
##### Request:  
`POST /api/v1/sessions`   
`Content-Type: application/json`   
`Accept: application/json`

`{`  
  `"email": "whatever@example.com",`    
  `"password": "password"`    
`}`    

#### 4. Road Trip       
##### Request:  
`POST /api/v1/road_trip`    
`Content-Type: application/json`   
`Accept: application/json`   

body:

`{`   
  `"origin": "Denver,CO",`    
  `"destination": "Pueblo,CO",`  
  `"api_key": "jgn983hy48thw9begh98h4539h4"`   
}`


## Figaro Setup 
Add Figaro to your Gemfile and `bundle install`:

```ruby
gem "figaro"
```

Figaro installation is easy:

```bash
$ bundle exec figaro install
```

This creates a commented `config/application.yml` file and adds it to your
`.gitignore`. Add your own configuration to this file and you're done!

Given the following configuration file:

```yaml
# config/application.yml

pusher_app_id: "2954"
pusher_key: "7381a978f7dd7f9a1117"
pusher_secret: "abdc3b896a0ffb85d373"
```

You can configure [Pusher](http://pusher.com) in an initializer:

```ruby
# config/initializers/pusher.rb

Pusher.app_id = ENV["pusher_app_id"]
Pusher.key    = ENV["pusher_key"]
Pusher.secret = ENV["pusher_secret"]
```

**Please note:** `ENV` is a simple key/value store. All values will be converted
to strings. Deeply nested configuration structures are not possible.
