XpLoSion
========

Description
---------------
XpLoSion is a gem that provides an easy way to create and define Excel'97 XLS files for Ruby. It works in a different way as other XLS exporters solutions because XpLoSion allows you to control exactly the structure and content of your XLS files independently of your views. That is entirely up to you.

The greatest part of Xplosion is that allows you to create a workbook with several worksheets with different types of data, as well as a single worksheet or whatever you are interested in.

Installation
---------------
This gem requires the [builder](https://github.com/jimweirich/builder) gem from our beloved and lost [Jim Weirich](https://github.com/jimweirich), so if you are using Rails or Sinatra you don't have to do nothing, as both frameworks include it *per se*. On other frameworks please refer to your inner documentation to find if **builder** is already included.

On your Gemfile please include:

    gem 'xplosion'

and then run:

    bundle install

Usage
---------
The XLS'97 format is in fact a XML with some particular structure and that's why we are using **builder** to build the XML file. Xplosion is in fact a helper set that abstracts the tedious work of implementing the XML/XLS by hand.

Xplosion has 4 methods:

* `xls_workbook`, which initializes the main workbook container in which worksheets and other elements will live.
* `xls_worhsheet(name)`, which declares the worksheet with the name passed by parameter. You can declare as many worksheets as you want.
* `xls_row`, which declares a new row.
* `xls_cell(value)`, which declares a cell with a particular value.

Examples
---------
Imagine you want to create a workbook with a single worksheet with your contacts information. First of all you have to decide which of all contacts attributes you want to display and once you've decided it create a colum_names string array. That's the hardest decision you will have to make. Let the magic happens.

First, go to the controller and add the next to your respond_to section of your desired action (e.g. index):

    class ContactsController < ApplicationController
      def index
        @contacts = Contact.all
        respond_to do |format|
          format.html
          format.xls
        end
      end
    end

OK! Now is when the magic starts!

Just create the corresponding view in `app/views/contacts`, with the name `index.xls.builder` and this content:

    xls_workbook(xml) do # xml is the default xml builder object
      xls_worksheet 'Contacts' do
        xls_row do
          xls_cell 'Name'
          xls_cell 'CIF'
          xls_cell 'Phone'
          xls_cell 'E-mail'
          xls_cell 'Address'
          xls_cell 'City'
        end
      end

      @contacts.each do |contact|
        xls_row do
          xls_cell contact.name
          xls_cell contact.cif
          xls_cell contact.phone
          xls_cell contact.email
          xls_cell contact.address
          xls_cell contact.city
        end
      end
    end

Finally, the corresponding link to download the XLS file would be something like:

    <%= link_to "Export to Excel'97", contacts_path(format: :xls) %>

And that's it! Have fun!
