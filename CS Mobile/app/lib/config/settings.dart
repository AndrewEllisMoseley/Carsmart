// --------------------------------------------------------------------------------
// This file contains application consts which are used throughout the application
// -------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// CS Mobile Application Settings
// -------------------------------------------------------------------------------
String baseURL = 'http://10.0.2.2:8000/'; // Base URL for backend
String accessTokenEndpoint =
    'api/token/obtain/'; // Endpoint for obtaining the access token
String refreshTokenEndpoint =
    'api/token/refresh/'; // Endpoint for refreshing the access token
String registerUser = 'auth/users/'; // Endpoint for registering a new user

// --------------------------------------------------------------------------------
// Mercedes Developer API Endpoints
// -------------------------------------------------------------------------------
String mercedesBaseURL =
    'https://api.mercedes-benz.com/experimental/connectedvehicle/v1/vehicles/';

String accessToken = '464dd616-7f69-4f12-9be5-c6837dcfec42';

// Like of endpoint urls
String tyres = '/tires';
String location = '/location';
String odometer = '/odometer';
String fuel = '/fuel';
String charge = '/stateofcharge';
String doors = '/doors';

// --------------------------------------------------------------------------------
// Google static map endpoint
// -------------------------------------------------------------------------------
String mapBaseURL = 'https://maps.googleapis.com/maps/api/staticmap?';
String marker =
    '&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:.%7C';
String key = '&key=AIzaSyBZeFuOWJE02iK9Ck7s_FyAS6Kw-l-Jntk';
