module ApplicationHelper
  def button_link_to(label, url, options={})
      link_to label, url, options.merge(:class => 'ui-state-default ui-corner-all button')
  end
end
