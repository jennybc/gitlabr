# Contributing to gitlabr

You're welcome to contribute to gitlabr by editing the source code, adding more convenience functions, filing issues, etc. This document compiles some information helpful in that process.

Please also note the [Code of Conduct](CONDUCT.md).


## Setup a local development environment

If you want to run the test suite locally, a few environment variables need to be set in order to connect to a Gitlab instance for testing. You find a default configuration in [tests/environment.yml](tests/environment.yml). From within R, you can load them from this file directly before running the tests:

```{r}
library(devtools)
library(yaml)
do.call(Sys.setenv, yaml.load_file("tests/environment.yml")) ## load test environment variables
test() ## run tests
```

With this configuration, your computer will connect over HTTPS to gitlab.points-of-interest.cc to perform test operations. *Please use the resources on this server responsibly*.

### API version

By default the test suite is run against API version 4. Since Gitlab instances also still serve API v3, you can switch to run the tests against API v3, by setting the environment variable `GITLABR_TEST_API_VERSION` to value `v3`. From gitlabr 1.0 on (expected in the second half of 2017), API v3 usage will be deprecated and the environment variable will be ignored.