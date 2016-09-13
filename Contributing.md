## Contributing

We value any contribution to Marlowe you can provide: a bug report,
a feature request, or code contributions. Marlowe is reasonably complex
code, so there are a few contribution guidelines:

*   Changes *will not* be accepted without tests. The test suite is written
    with [Minitest][].
*   Match our coding style.
*   Use a thoughtfully-named topic branch that contains your change. Rebase
    your commits into logical chunks as necessary.
*   Use [quality commit messages][].
*   Do not change the version number; when your patch is accepted and a release
    is made, the version will be updated at that point.
*   Submit a GitHub pull request with your changes.

### Test Dependencies

Marlowe uses Ryan Davis’s [Hoe][] to manage the release process, which
adds a number of rake tasks. You will mostly be interested in:

    $ rake

which runs the tests the same way that:

    $ rake test
    $ rake travis

will do.

To assist with the installation of the development dependencies for
Marlowe, I have provided the simplest possible Gemfile pointing to the
(generated) `marlowe.gemspec` file. This will permit you to do:

    $ bundle install

to get the development dependencies. If you aleady have `hoe` installed, you
can accomplish the same thing with:

    $ rake newb

This task will install any missing dependencies, run the tests/specs, and
generate the RDoc.

### Workflow

Here's the most direct way to get your work merged into the project:

*   Fork the project.
*   Clone down your fork (`git clone
    git://github.com/KineticCafe/marlowe.git`).
*   Create a topic branch to contain your change (`git checkout -b
    my_awesome_feature`).
*   Hack away, add tests. Not necessarily in that order.
*   Make sure everything still passes by running `rake`.
*   If necessary, rebase your commits into logical chunks, without errors.
*   Push the branch up (`git push origin my_awesome_feature`).
*   Create a pull request against KineticCafe/marlowe and describe
    what your change does and the why you think it should be merged.

### Contributors

*   Trevor Oke [@thefury](https://github.com/thefury) created marlowe.
*   Austin Ziegler [@halostatue](https://github.com/halostatue)
*   Adam Solove [@asolove](https://github.com/asolove)
*   Tim Morton [@tmorton](https://github.com/tmorton)

[Minitest]: https://github.com/seattlerb/minitest
[quality commit messages]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[Hoe]: https://github.com/seattlerb/hoe
[kccoc]: https://github.com/KineticCafe/code-of-conduct
