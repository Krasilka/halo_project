require 'ffaker'

class ContentPage
  include PageObject

  button(:create_module, xpath:"//*[contains(@class,'haloicon-create')]/ancestor::button")
  text_field(:module_name, type: 'text')
  radio_button(:single_on_btn, value: 'on')
  button(:submit_creation, text: 'Create')
  table(:table_list, class:'FlexTable')
  button(:search, xpath:"//*[contains(@class,'haloicon-search')]/ancestor::button")
  text_field(:search_input, class:'toolbarSearchButtonInput')
  button(:confirm_delete, class:'swal2-confirm swal2-styled')
  buttons(:bin_icon, xpath:"//*[contains(@class,'haloicon-bin')]/ancestor::button")

  def create_new_module(module_name = FFaker::Name.unique.name)
    create_module
    sleep 2
    self.module_name_element.set(module_name)
    radio_button_element.click
    submit_creation
    module_name
  end

  def search_for(module_name)
    sleep 2
    search
    self.search_input_element.set(module_name)
  end

  def delete_module(module_name)
    rows_text = divs(:class, 'Grid__cell').collect(&:text)
    ind = rows_text.index { |val| val.include? module_name }
    puts ind
    bin_icon_elements[ind].click
  end

  def confirm_deletion
    confirm_delete
  end
end