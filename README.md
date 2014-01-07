# Cocoonase

The best topping for turning your cocoon app into a butterfly.

Rails scaffold generator enhancements and cocoon, inherited resources, simple form, active model serializers and bootstrap companion.

Generate rails scaffold with full has_one, has_many and habtm associations and hierarchical model support for forms through
cocoon and serialization through active model serializers. Controllers from inherited resources, models with has scope,
pagination in kaminari, css framework bootstrap with many additional simple form input types like date ond time pickers
wysiwyg textareas, switch radio buttons, currency field, mobile fax and telephone number fields, and many more, all
intuitively assumed from field names but easily modifiable. Using show for as display engine to be logically similar to
the forms. Generates modular templates with separate display, capture and list files for every associated model that can
easily be interchanged.

All dependencies, gems and client side components are already included.

## Installation

Add this line to your application's Gemfile:

    gem 'cocoonase'

And then execute:

    $ bundle

## Usage

Generate cocoonase_model or cocoonase_scaffold with additional `belongs_to` definitions.

```
rails generate cocoonase_model user profile:belongs_to:has_one etc....
```

or

```
rails generate cocoonase_model user social_network:belongs_to:has_many etc...
```

or

```
rails generate cocoonase_model user address:has_and_belongs_to_many etc...
```

TODO: More usage instructions to follow, contributions welcome.

## Contributing to cocoonase

### Guidelines
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* If no similar issues were found create a new issue explaining the changes/problem and stating your intention to work on it.
* Fork the project.
* Start a feature/bugfix branch.
* Make sure to add tests for . This is important so I don't break it in a future version unintentionally.
* Please try and produce isolated commits trying to logically group changes to their own commits to simplify review and so that I can cherry-pick around them if needed.
* Reference the `#`n number of the issue you created before you started i.e. Fix for \#1

### Pull request instructions
1. Fork it ( http://github.com/<my-github-username>/cocoonase/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Choose to add logically isolated changes together (`git add -p`)
3. Commit all the additions separately (`git commit -m "Short title summary.\n\nMore elaborate description."`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request against the development branch.


## Copyright
Copyright (c) 2014 nickl-.

See LICENSE for details.
