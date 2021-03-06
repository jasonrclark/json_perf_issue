json_perf_issue
===============

Code for duplicating a potential JSON performance issue on Rbx

# Running

```
~/json_perf_issue: bundle install
Using bundler (1.3.5)
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
~/json_perf_issue: ./go.sh
```

# Results

**2.0.0-p247**
```
~/json_perf_issue:rbenv shell 2.0.0
~/json_perf_issue:./go.sh
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
Darwin Soupy.local 12.5.0 Darwin Kernel Version 12.5.0: Mon Jul 29 16:33:49 PDT 2013; root:xnu-2050.48.11~1/RELEASE_X86_64 x86_64
user     system      total        real
0.280000   0.020000   0.300000 (  0.307067)
```


**rbx-2.0.0**
Rubinius SHA: 278c65d43dd763d78950fbf6943b805ca7a93f49 (see *My Setup*)

```
~/json_perf_issue:rbenv shell rbx-2.0.0
~/json_perf_issue:./go.sh
rubinius 2.0.0n280 (2.1.0 278c65d4 2013-10-07 JI) [x86_64-darwin12.4.0]
Darwin Soupy.local 12.5.0 Darwin Kernel Version 12.5.0: Mon Jul 29 16:33:49 PDT 2013; root:xnu-2050.48.11~1/RELEASE_X86_64 x86_64
user     system      total        real
419.158017   2.104734 421.262751 (421.386591)
```

`rbx_json_generate_profile.txt` contains a backtrace taken during the JSON generation via OS X's sample process.
`xprofile.txt` contains the output from running with `-Xprofile` enabled.

# My Setup

```
~/json_perf_issue: uname -a
Darwin Soupy.local 12.5.0 Darwin Kernel Version 12.5.0: Mon Jul 29 16:33:49 PDT 2013; root:xnu-2050.48.11~1/RELEASE_X86_64 x86_64
```


ufucompiled Rubinius uuom uOurce, per these steps (still using rbenv for switching, but [had trouble getting](http://nerd.jasonrclark.com/2013/10/running-rubinius-with-rbenv.html) `rbenv install rbx-2.0.0` to work)

```
~: git clone https://github.com/rubinius/rubinius.git && cd rubinius
~/rubinius: ./configure --prefix=~/.rbenv/versions/rbx-2.0.0
~/rubinius: rake install
```
