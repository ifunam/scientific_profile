module ApplicationHelper
  def button_link_to(label, url, options={})
      link_to label, url, options.merge(:class => 'ui-state-default ui-corner-all button')
  end
  
  def sanitize_html(content)
     content.gsub!(/\n/,'')
     content.gsub!(/'/,"\"") 
     content.gsub!(/"/,"\\\"")
     content.chomp
  end

end
