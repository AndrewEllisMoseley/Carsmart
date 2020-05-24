// --------------------------------------------------------------------------------
// This file contains application consts which are used throughout the application
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
    'https://api.mercedes-benz.com/experimental/connectedvehicle_tryout/v1/vehicles/';

String dummyVehicleID = '1234567890ABCD1234';
String dummyBearerToken = 'a1b2c3d4-a1b2-a1b2-a1b2-a1b2c3d4e5f6';
