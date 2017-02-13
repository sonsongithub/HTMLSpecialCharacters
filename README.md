# HTMLSpecialCharacters

Library to escape/unescape HTML special characters in Swift.
[Google Toolbox for Mac](https://github.com/google/google-toolbox-for-mac) is known as a great library which supports escaping/unescaping HTML special characters.
But it's written in Objective-C.

# Test code

HTMLSpecialCharacters passed the alomost same test code of [Google Toolbox for Mac](https://github.com/google/google-toolbox-for-mac/blob/master/Foundation/GTMNSString%2BHTMLTest.m).
Please check it.

# Performance

HTMLSpecialCharacters can escape/unescape HTML special chracters much faster than[ Google Toolbox for Mac](https://github.com/google/google-toolbox-for-mac).
The figure below shows the performance of escaping/unescaping the test code. These score were measured on iMac (27-inch Late 2012). 
Test code for Google Toolbox for Mac is [here](https://github.com/sonsongithub/GTMHTMLSpecialCharacters).

<img src="https://cloud.githubusercontent.com/assets/33768/22871076/e53e512e-f1f0-11e6-8a9a-33e26a7d41aa.png" width=640px>

<img src="https://cloud.githubusercontent.com/assets/33768/22871075/e5352ad6-f1f0-11e6-844a-6428009f343f.png" width=640px>

# Acknowledgement

[@norio_nomura](https://github.com) gave me a lot of codes and comments. This project is based on [his code](https://gist.github.com/norio-nomura/2a79822004e7c89228300cf19595ca99).

# License

MIT License. This library includes source codes of [Google Toolbox for Mac](https://github.com/google/google-toolbox-for-mac).