# Browser in Docker

Use Docker to sandbox browser (Firefox ?)

## X11 Server 

On Mac OS X, I use [XQuartz](http://xquartz.macosforge.org/landing/).

We need socat to expose socat
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install socat
```

```
DISPLAY=$( find /private/tmp/com.apple.launchd.* -name org.macosforge.xquartz:0 )

socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```

## Docker


