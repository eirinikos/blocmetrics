##Blocmetrics

An analytics service with the following features:
- a client-side JS snippet that allows a user to track events on their website
- a server-side API that captures and saves those events to a database
- a Rails application that displays the captured event data for a user

Made with my mentor at [Bloc](http://bloc.io).

###The client-side JS snippet

This is stored [right here on Github](https://raw.githubusercontent.com/eirinikos/blocmetrics/master/blocmetrics_clientside_snippet.js).

If you're trying Blocmetrics in development, use [this URL](https://rawgit.com/eirinikos/blocmetrics/master/blocmetrics_clientside_snippet_development.js) as your `script src`. This sets the URL endpoint of our events endpoint to: `http://localhost:3000/api/events`

If you're using Blocmetrics in production, use [this URL instead](https://cdn.rawgit.com/eirinikos/blocmetrics/master/blocmetrics_clientside_snippet_production.js). This sets the URL endpoint of our events endpoint to: `http://kao-bloccitoff.herokuapp.com/api/events`. Please also note the `https://cdn.rawgit.com/...` domain.

Per [this Stack Overflow discussion](http://stackoverflow.com/questions/17341122/link-and-execute-external-javascript-file-hosted-on-github/18049842#18049842):
*GitHub started using X-Content-Type-Options: nosniff, which instructs more modern browsers to enforce strict MIME type checking. It then returns the raw files in a MIME type returned by the server - preventing the browser from using the file as-intended (if the browser honors the setting).*

To see an example of Blocmetrics in action, run Blocmetrics and [Bloccitoff](https://github.com/eirinikos/bloccitoff#tracking-by-blocmetrics) side-by-side.