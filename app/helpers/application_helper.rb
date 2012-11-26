module ApplicationHelper

  def menu
    @menu = ''
    @menu_items.try(:each) { |item| @menu << menu_item(item) }
    content_tag( :ul, raw(@menu))
  end
  
  private

    def menu_item(item)
      @i = ''
      subitems = MenuItem.where(parent_id: item.id).each { |i| @i << content_tag(:li, link_to(i.name, "/" + i.url)) } 
      sub_menu = content_tag(:ul, raw(@i))
      content_tag(:li, link_to(item.name, item.url) + sub_menu)
    end

end
