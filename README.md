Cuba-app
========

A template for Cuba applications, inspired by Harmoni's.

Usage
-----

For information about usage, execute:

```
$ rake
```

This will list the available tasks.

Requirements
------------

- Bundler

Installation
------------

Use git to clone the repository:

```
$ git clone https://github.com/Gangwolf/cuba-app.git <app_name>
```

Switch to the application folder:

```
$ cd <app_name>
```

Execute the following commands:

```
$ rm -rf .git
$ rake install
```

Now test the application by running:

```
$ rake server
```

Open <http://localhost:3000>. This will launch a demo page based on Initializr's responsive template.
