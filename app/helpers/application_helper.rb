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

  def link_to_move_item(navlink)
    links = ''
    links += link_to('left', move_up_admin_navlink_path(:id => navlink.id), :class => 'ui-button-icon-primary ui-icon ui-icon-arrowthick-1-n', :style => 'float: left;') unless navlink.left_sibling.nil?
    links += link_to 'right', move_down_admin_navlink_path(:id => navlink.id), :class => 'ui-button-icon-primary ui-icon ui-icon-arrowthick-1-s' unless navlink.right_sibling.nil?
    links = '- -' if navlink.right_sibling.nil? and navlink.left_sibling.nil?
    links
  end

end
