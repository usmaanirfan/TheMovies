# iOS  Assignment - TheMovies 
## An iOS(iPhone/iPad)  app to show movies poster and detail from https://developers.themoviedb.org/ built in Swift using Xcode 12.4

## Description
This app is being developed using VIPER/Protocol oriented approach. This App contains two modules. First modules(PopularMoviesList) shows the poster of top 10 movies based on popularity. Second module(MovieDetail) display the detail of respective movie.

Apart from above two modules Network manager works as service layer, Common module as a helper, AppLaunch as launcher. PopularMoviesList module contains view controller, presenter, interactor and router. Interactor  interact with service layer to fetch  movies. Application business logic goes into interactor while presentation logic goes into Presenter. While Navigation, dependency, data passing related activities is being  taken care by Router.

## Dependency
This project has dependency on third party library  Alamofire,Kingfisher,ObjectMapper and SwiftyJSON for network call, lazy loading, json to SwiftObject and data to json conversion. Project has used Swift Package dependencies which is available on https://github.com/Alamofire/Alamofire.git, https://github.com/onevcat/Kingfisher.git, https://github.com/SwiftyJSON/SwiftyJSON.git https://github.com/tristanhimmelman/ObjectMapper.git,  


## Getting Started
Clone this repo to your hard drive using 'git clone https://github.com/usmaanirfan/TheMovies.git'. Open 'TheMovies.xcodeproj' in Xcode. It will automatically start  downloading third party dependencies . Once dependencies are downloaded. You are good to run this project in Xcode.

## Testing
The tests can be run in Xcode by pressing Cmd + U after selecting Test target TheMoviesTests.
There are currently unit tests, using some mock classed and json files.

## Tools used
Xcode 12.4 , Simulator(iPhone 11/iPad) iOS 14 and iOS 14 (iPhone 7)
