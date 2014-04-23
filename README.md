XpLoSion
========

Description
---------------
XpLoSion is a gem that creates an easy way to create and define XLS Excel'97 files on a Rails environment. It works on a different way as other XLS exporters solutions because XpLoSion allows you to control exactly the structure and content of your XLS files independently of your views or exactly like them. It's up to you.

The great part of Xplosion is that allows you to create a workbook with several worksheets with different types of data as also can create a single worksheet or whatever you are interested on.

Installation
---------------
This gem requires the Rails included XML handler gem Builder of our beloved and lost Jim Weirich, so if you are using Rails or Sinatra you don't have to do nothing. On other frameworks please refer to your inner documentation to find if Builder is already included.

On your Gemfile please include:

  gem 'xplosion'

and then run:

  bundle install

or you can use the command line instruction:
  
  gem install 'xplosion'

Usage
---------

XLS'97 is in fact a XML with some particular structure and that's why we are using XML Builder gem to implement the format. Xplosion is in fact a helper with some methods that abstract the tedious work of implementing the XML/XLS by hand.

Imagine you want to create a workbook with a single worksheet with your contacts information. First of all you have to decide which of all contacts attributes you want to display. To do this, Rails uses a decorator which is a kind of helper more related to the view than to the controller, although it can be used in both sides. So, if you don't have already create a decorator lets hands on it.

First, create a folder 'decorators' on app folder, and name it with the name of the controller from which you want to  call it, in my case 'contact_decorator.rb'. So you'll have something like this:

  app/decorators/contact_decorator.rb

Inside it you have to declare your methods like this:
