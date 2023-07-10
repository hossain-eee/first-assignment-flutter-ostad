# Module_9_assignment

an app fetches lat and lon and according to lat and lon show weather information. By the top two icon (action) it is basically useless according to ostad instruction but I put there reload facility of data.

when data is fetching show loading indicator(circularIndicator widget) until data is reached and we do this by true false. 
When an error occurs (link is not correct) then show error alert and there are two options one is close the alert box and another is reload/refresh, if i correct the link then by this reload again data will come, this also can be achieved by top two action icon. But keep in mind that when link error is solved then must perform hot reload by Ctrl+S then refresh button will work.

make background gradient, when data is not loading then also gradient should display. 

get json data from api using http request. 

getCurrentPosition() method is created for get lat and lon and this lat lon will use api to get data for user current location so api fetch method  getWeatherDataApiFetch() called inside this getCurrentPosition() method and unix to local time and kelvin to celsius conversion method is called inside getWeatherDataApiFetch(). so according to chain getCurrentPosition() is parent method so its call inside initState() and other button onPress() function to refresh the data.

if any problem occur then first clean flutter and get it again by 
$ flutter clean
$ flutter pub get

# Output 


![Screenshot_1688936593](https://github.com/hossain-eee/flutter-assignment-ostad/assets/101991583/073400e9-beed-4252-8d93-4c99b8f03ba1)
![Screenshot_1688936604](https://github.com/hossain-eee/flutter-assignment-ostad/assets/101991583/9a29a8f8-db6a-47f1-8d3a-b8fdc4ab22cc)
![Screenshot_1688936914](https://github.com/hossain-eee/flutter-assignment-ostad/assets/101991583/96b942c2-a66b-46a0-9298-4e57f3d78a58)
![Screenshot_1688937046](https://github.com/hossain-eee/flutter-assignment-ostad/assets/101991583/ac23acbf-6048-413f-bbb4-183a35fe7281)
![Screenshot_1688937053](https://github.com/hossain-eee/flutter-assignment-ostad/assets/101991583/20d4d1d0-5b56-46bc-9782-fe66f7286ed0)
![Screenshot_1688970883](https://github.com/hossain-eee/flutter-assignment-ostad/assets/101991583/0f2067bb-dbb5-4222-a1da-040e3cafb0c4)

# Ostad
মডিউল ৯ এর এসাইনমেন্ট

Create a simple weather app that fetches and displays the current weather conditions for a user's location.

Requirements

The app should display the user's current location and the current weather conditions, including the temperature and weather description (e.g. sunny, cloudy, etc.) with a descriptive image of the weather.

The app shows a loading indicator when data is being fetched from the api.

The app should display an error message if there is a problem fetching the weather data.

You may use a custom font for the temperature and weather description.

You can use the OpenWeatherMap API or any free weather API to fetch weather data.

## Guidelines

Do not use a weather-specific package or library (e.g. Flutter Weather, OpenWeather).
