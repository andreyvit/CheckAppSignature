CheckAppSignature
=================

Run this application, drop .ipa or .app into its window and see the signature.


How it works
------------

IPA file is extracted into a temp directory, and then

    codesign -dvvv /path/to/the.app

is run.

See
[TN2250: Understanding and Resolving Code Signing Issues](http://developer.apple.com/library/ios/#technotes/tn2250/_index.html#//apple_ref/doc/uid/DTS40009933)
for more info.


Installation
------------

Click Download, extract the downloaded .zip and drop it into Applications.
