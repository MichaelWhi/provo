ProVo
====
[![Code Climate](https://codeclimate.com/github/MichaelWhi/provo.png)](https://codeclimate.com/github/MichaelWhi/provo)

ProVo is a web application to showcase the projects at your organization / group.

You know...
----
* You wanna start a class/research project and wonder about getting data, current literature. Or you just wanna talk with an "expert" on this topic, who has some experience in that field.

  Whom should you contact?

* You wonder about using technology X (let's say: Hadoop). Is someone at your organization is already trying out or using it? Maybe there is some inofficial cluster around or somebody wrote something about the topic.

  But where would you find that person?

*ProVo* solves that!
---

You'd simply search for it or browse through the list of topics/tags. You would then find a short description, some links - and most important - a contact.

When you start a new project, you then would fill out a small form and enter or paste a summary to create a project. Less than 5 minutes and it's done.

ProVo will ask you after a while whether the info is still current and you're still working on the project.

And everyone will benefit! :-)

Features
---

* List, search and view projects, and use tags to find similar projects
* enter new projects easily in less than 5 minutes
* attach files to projects - as many as you want (images, pdf, doc, zip, videos,  code, ...)
* format your project description (with Markdown), include pictures, links, ...
* "star" projects, so you can remember them. They'll stay current even if the name changes (kinda bookmarking projects)
* show your ProVo projects on your own website (you only need to copy/paste one line of HTML-code)
* consume project info with the API: ProVo serves JSON, XML and implements the [projecta microformat](http://microformats.org/wiki/projecta)

Demo
---

The master branch runs at [provo.herokuapp.com](http://provo.herokuapp.com). 

You might experience a delay for the first request. 

Unfortunately, the file upload currently doesn't work on heroku...
So you might wanna try it quickly localy to see it in real action. :-)

Install and Run 
---

* Get the source: `git clone git://github.com/MichaelWhi/provo.git`
* ONLY if you don't have a current ruby: install ruby 2.0.0, e. g. with RVM: `rvm install 2.0.0 && rvm use 2.0.0` ([get RVM here](https://rvm.io))
* install bundler: `gem install bundler --pre`
* go in to the directory: `cd provo`
* run `bundle install` to install dependencies (rails and other stuff)
* run `bundle exec rake db:migrate` to setup the local sqlite database
* run `bundle exec rails s` and surf to [localhost:3000](http://localhost:3000/) – exit the server with CTRL+C (CMD+.)
* :-)

Logo
---

So far, we have this very creative logo:

![Logo](https://homepages.uni-paderborn.de/mwhittak/media/provo.png)

What does ProVo stand for?
----

I had the idea very late and wasn't able to figure out that "ProVo" actually is not a good abbreviation for "PROject OVerview" ;-)

Copyright
---
(c) 2013 Michael Whittaker

(Please note that the use of the logo of the University of Paderborn is only for demo purpose; the logo is copyrighted.)
