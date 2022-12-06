# Hierarchical MVC Demo Application

This demo application leverages ColdBox and hierarchical MVC to create a nice contacts API with JWT security.  It was written using behavior driven development and it is fully documented via `cbSwagger`.

To get started do the following using CommandBox CLI:

```bash
box install
box server start
```

Then you can run the application and execute the following endpoints with the base URL of: `http://localhost:{port}/api/v1`

```js
// API Echo
get( "/", "Echo.index" );

// API Authentication Routes
post( "/login", "Auth.login" );
post( "/logout", "Auth.logout" );
post( "/register", "Auth.register" );

// API Secured Routes
get( "/whoami", "Echo.whoami" );

// Contacts API
apiResources( "contacts" );
```

You can use the following credentials for access:

- username : `admin@coldbox.org`
- password : `admin`

---

## THE DAILY BREAD

 > "I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12
