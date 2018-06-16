class HomePage
  include PageObject

  span(:burger_menu, id:'left-menu-burger' )
  span(:content, id:'left-menu-content')

  def go_to_content_page
    burger_menu_element.click
    sleep 1
    span(id:'left-menu-content').click
  end

end