# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    # edit this. this is just a placeholder to make cucumber work
    when /^the (TWC )?login\s?page$/ then login_path
    when /^the Work Order page$/ then work_order_home_path

    # we still need to access the specific page for a work order's item list. item_list_path(work order id)
    when /^the Item List page for order number "(.*)"/ then item_list_path($1)
    when /^the Confirmation page for order number "(.*)"/ then confirmation_path
      # we still need to access the specific page for this work order. add_to_work_order_path(work order id)
    when /^the Add To Work Order page for order number "(.*)"$/ then add_item_path

    when /^the Store Item page$/ then store_item_path

    when /^the Update Quantities page$/ then update_quantity_path

  
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
