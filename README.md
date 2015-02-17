Redmine More Blocks Extension
=======================

[![Build Status](https://travis-ci.org/kiv-redmine/redmine_more_blocks_extension.svg)](https://travis-ci.org/kiv-redmine/redmine_more_blocks_extension) [![Inline docs](http://inch-ci.org/github/kiv-redmine/redmine_more_blocks_extension.svg?branch=master)](http://inch-ci.org/github/kiv-redmine/redmine_more_blocks_extension)

Add few more very usefull blocks on my page.

How to run build on travis?
---------------------------
First of all try to run tests in your environment:

```ruby
ruby plugins/redmine_more_blocks_extension/test/**/*.rb
```

If everyhting is ok, push your changes into master branch and run merge script, which merge master into testing and push to remote (github):

```bash
./push_for_test.sh
```

