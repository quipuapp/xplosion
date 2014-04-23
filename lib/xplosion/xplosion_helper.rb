module Xplosion
  module XplosionHelpers
    WORKBOOK_NAMESPACES = {
       "xmlns" => "urn:schemas-microsoft-com:office:spreadsheet",
       "xmlns:o" => "urn:schemas-microsoft-com:office:office",
       "xmlns:x" => "urn:schemas-microsoft-com:office:excel",
       "xmlns:ss" => "urn:schemas-microsoft-com:office:spreadsheet",
       "xmlns:html" => "http://www.w3.org/TR/REC-html40"
     }
    
     def xls_workbook(xml, &block)
       xml.instruct!
       xml.Workbook WORKBOOK_NAMESPACES do |workbook|
         go_down(workbook, block)
       end
     end
    
     def xls_worksheet(name, &block)
       xls_parent.Worksheet "ss:Name" => name do |worksheet|
         worksheet.Table do |table|
           go_down(table, block)
         end
       end
     end
    
     def xls_row(&block)
       xls_parent.Row do |row|
         go_down(row, block)
       end
     end
    
     def xls_cell(value)
       xls_parent.Cell do |cell|
         type,value = xls_cell_type_from(value)
         cell.Data value, "ss:Type" => type
       end
     end
    
     private
    
     def xls_context
       @xls_context ||= []
     end
    
     def go_down(parent, block)
       xls_context.push(parent)
       block.call
       xls_context.pop
     end
    
     def xls_parent
       xls_context.first
     end
    
     def xls_cell_type_from(value)
       return ['Number', value] if value.is_a?(Numeric)
       return ['String', value.to_date.to_s] if value.is_a?(DateTime) || value.is_a?(Date) || value.is_a?(Time)
       ['String', value]
     end   
  end
end
