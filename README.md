CheckAppSignature
=================

[Download CheckAppSignature-1.0.zip](https://github.com/downloads/andreyvit/CheckAppSignature/CheckAppSignature-1.0.zip),
run, drop .ipa or .app into its window and you'll see the code signature details.


How it works
------------

IPA file is extracted into a temp directory, and then

    codesign -dvvv /path/to/the.app

is run.

See
[TN2250: Understanding and Resolving Code Signing Issues](http://developer.apple.com/library/ios/#technotes/tn2250/_index.html#//apple_ref/doc/uid/DTS40009933)
for more info.
