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


Xplosion have 4 methods:

    xls_workbook #this method initialize the main workbook container in which will live worksheets and other elements.
    xls_worhsheet(name) #this method declares the worksheet as insert a name on it. You can declare as many worksheets as you want. (see later examples)
    xls_row #this method declares the start of a new row
    xls_cell(data) #this method declares the content of a particular cell

Examples
--------

Imagine you want to create a workbook with a single worksheet with your contacts information. First of all you have to decide which of all contacts attributes you want to display and once you've decided it create a colum_names string array. That's the hardest decision you will have to make. Let the magic happens.


SINGLE WORKSHEET:

First, go to the controller and add the next to your respond_to section of your desired action (e.g. index):

    #inside contacts_controller.rb
    def index
     @contacts=Contact.all
     respond_to do |format|
       format.html
       format.xls do
          @column_names=['name'. 'cif', 'phone', 'email', 'address', 'city'] #I have chosen this ones
          render 'app/views/contacts/index' #or your prefered view path
       end
     end
    end
    
Ok! Now is when the magic starts!

Create a file in your prefered views path called:

    index.xml.builder
    
And inside it write:

    #inside index.xls.builder
    xls_workbook(xml) do #xml is the default xml builder object
      xls_worksheet 'Contacts' do
        xls_row do
          @column_names.each do |column_name|
          xls_cell(column_name)
        end
      end
      @contacts.each do |contact|
        xls_row do
            xls_cell(contact.data)
            xls_cell(contact.cif)
            xls_cell(contact.phone)
            xls_cell(contact.email)
            xls_cell(contact.address)
            xls_cell(contact.city) # Remember to fit column_names with number of cells
          end
        end
      end
    end
    
Now you have to put a link in your index.html.erb or index.html.slim or whatever your view action lives:

    <%= link_to "Export Excel'97", contacts_path(format: :xls) %>
    
And that's it! Have fun!

For Multiple worksheets you just have to duplicate worksheet block.
