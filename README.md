# varsko

Weechat ruby script to pop up pretty little notification messages when you get a highlight or a private message.

## official script status

```varsko``` ([version 0.0.5](https://github.com/komidore64/varsko/blob/v0.0.5/varsko.rb)) is currently under review to be added to the Official Weechat scripts repository (as of April 08, 2013).

If or when ```varsko```is approved, I will update the official script to the most current, stable version that's hosted on Github.

## manual installation

If you're just so excited to start using ```varsko``` that you can't wait for it to be added to the official Script list:

1. [download](https://raw.github.com/komidore64/varsko/master/varsko.rb) ```varsko.rb```
2. put it in ```~/.weechat/ruby/```
3. if you want Weechat to autoload the script on startup, symlink it to ```~/.weechat/ruby/autoload/varsko.rb```

just give me the commands, chief

```bash
wget -O varsko.rb https://raw.github.com/komidore64/varsko/master/varsko.rb
mv varsko.rb ~/.weechat/ruby/
pushd ~/.weechat/ruby/autoload/
ln -s ../varsko.rb
popd
```

## help me help you

If you've come across a bug or error in ```varsko```, please submit a [Github issue](https://github.com/komidore64/varsko/issues) describing the problem, and what version of ```varsko``` you're using.
