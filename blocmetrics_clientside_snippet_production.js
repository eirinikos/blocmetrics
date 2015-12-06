// declare an empty object & thus create a namespace for blocmetrics code
// create the report function as a property on the empty object
var blocmetrics = {};
    blocmetrics.report = function(eventName){
    // create the report function as a property on the blocmetrics object
        var event = { name: eventName }; // create an event JSON object
        var request = new XMLHttpRequest(); // initialize a new XMLHttpRequest (AJAX request)

        request.open("POST", "http://kao-bloccitoff.herokuapp.com/api/events", true);
        // set HTTP method to POST, set the URL of our events endpoint
        // and allow request to run asynchronously

        request.setRequestHeader('Content-Type', 'application/json');
        // set the request Content-Type header to 'application/json'
        // this is how our API::EventsController knows how to process the request as JSON

        request.send(JSON.stringify(event)); // send the request
      };