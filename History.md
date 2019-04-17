### 3.0 / 2019-04-17

*   Added a Faraday request middleware.
*   Replaced Hurley example with examples for the use of the Faraday
    middleware.
*   Added global Marlowe configuration.

### 2.0 / 2016-11-16

*   Breaking change: the correlation header defaults to `X-Request-Id` instead
    of `Correlation-Id`.
*   Breaking change: by default, the `correlation_id` is sanitized in the same
    way as `ActionDispatch::RequestId` when provided from an upstream
    source (only alphanumerics with dashes up to 255 characters in
    length).
*   Breaking change: by default, the `correlation_id` is returned to the client
    as part of the response.
*   Marlowe is more configurable now.

### 1.0.3 / 2016-01-15

*   Update Readme example of using available formatted subclass.
*   Make the correlation header name configurable

### 1.0.2 / 2015-11-24

*   Add documentation for using Marlowe with [lograge][].

### 1.0.1 / 2015-10-20

*   Update gemspec with homepage
*   Update Rakefile

### 1.0.0 / 2015-10-16

*   Initial Commit

[lograge]: https://github.com/roidrage/lograge
