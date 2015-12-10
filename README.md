##Blocmetrics

An analytics service with the following features:
- a client-side JS snippet that allows a user to track events on their website
- a server-side API that captures and saves those events to a database
- a Rails application that displays the captured event data for a user

Made with my mentor at [Bloc](http://bloc.io).

####Lovely Javascript charts
The pie and line charts are enabled by [Chartkick](https://github.com/ankane/chartkick). [Groupdate](https://github.com/ankane/groupdate)works hand-in-hand with Chartkick and makes it easy to group temporal data. 

####User authentication, session control, account activation, password reset
I relied (heavily, gratefully) on [Michael Hartl's Rails tutorial](https://www.railstutorial.org/book/frontmatter) to implement these features. I also tried to implement some testing - insofar as I was able to use RSpec without diverging too far from the tutorial's code (which uses Rails' built-in `minitest`).

####Updating a registered application
At the moment, a user's website/application can be created, destroyed, and shown, but not edited (the "Update an application" link currently leads nowhere, as shown in the app layout excerpt below). Working on this!

```
<li class="dropdown">
  <a href='#' class="dropdown-toggle" data-toggle="dropdown">
    Applications <b class="caret"></b>
  </a>
  <ul class="dropdown-menu">
    <li><%= link_to "See all applications", registered_applications_path %></li>
    <li><%= link_to "Add an application", new_registered_application_path %></li>
    <li class="divider"></li>
    <li><%= link_to "Update an application", '#' %></li>
  </ul>
</li>
```

####The client-side JS snippet
This is stored [right here on Github](https://raw.githubusercontent.com/eirinikos/blocmetrics/master/blocmetrics_clientside_snippet.js).

If you're trying Blocmetrics in development, use [this URL](https://rawgit.com/eirinikos/blocmetrics/master/blocmetrics_clientside_snippet_development.js) as your `script src`. This sets the URL endpoint of our events endpoint to: `http://localhost:3000/api/events`

If you're using Blocmetrics in production, use [this URL instead](https://cdn.rawgit.com/eirinikos/blocmetrics/master/blocmetrics_clientside_snippet_production.js). This sets the URL endpoint of our events endpoint to: `http://kao-bloccitoff.herokuapp.com/api/events`. Please also note the `https://cdn.rawgit.com/...` domain in the `script src`.

Per [this Stack Overflow discussion](http://stackoverflow.com/questions/17341122/link-and-execute-external-javascript-file-hosted-on-github/18049842#18049842):
*GitHub started using X-Content-Type-Options: nosniff, which instructs more modern browsers to enforce strict MIME type checking. It then returns the raw files in a MIME type returned by the server - preventing the browser from using the file as-intended (if the browser honors the setting).*

To see an example of Blocmetrics in action, run Blocmetrics and [Bloccitoff](https://github.com/eirinikos/bloccitoff#tracking-by-blocmetrics) side-by-side.