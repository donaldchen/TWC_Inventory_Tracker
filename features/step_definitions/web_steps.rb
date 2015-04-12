require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))
module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^I am logged in$/) do
  visit("/")
  fill_in("email", :with => "test1@test1.com")
  fill_in("password", :with => "test1")
  click_button("Sign in")
end

Given(/^I am not logged in$/) do
  # Don't do anything
end

Given(/^I make a new Work Order$/) do
    rand_num = 91235
    id = Care_Package__c.find_by_id__c(rand_num)
    while id is not nil
      rand_num = rand(10000)
      id = Care_Package__c.find_by_id__c(rand_num)
    end

    @care_package = Care_Package__c.new
    Care_Package_c.id = id
    @care_package.save
end

Given(/^I delete Work Order with order number "(.*)"$/) do |id|
  @care_package = Care_Package__c.find_by_id__c(id)
  @care_package.delete
end

Given(/^the following items exist in the inventory$/) do |item_table|
  item_table.hashes.each do |item|
    entry = Inventory.create(item: item['item'], code: item['code'], quantity: item['quantity'])
  end
end

Given(/^the following work order with order number "(.*)" exists$/) do |order_number, item_table|
  item_table.hashes.each do |item|
    entry = WorkOrder.create(item: item['item'], quantity: item['quantity'], code: order_number)
  end
end

Given(/^ I am on the Add To Work Order for order number "(.*?)"$/) do |arg1|
  # visit("/work_order_home")
  # fill_in("work_order", :with => "123")
  # click_button("Select Code")
  # click_button("Add")
end

# Then(/^I should be on the Item List page for order number "(.*?)"$/) do |arg1|
#   pending # express the regexp above with the code you wish you had
# end

When /^(?:|I )fill in "([^"]*)" with quantity "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value, :match => :first)
end

When(/^I press the Update button$/) do
  first('.item').click()
end

Then(/^I should see "(.*?)" with quantity "(.*?)"$/) do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end

Then(/^I should not see "(.*?)" with quantity "(.*?)"$/) do |arg1, arg2|
  if page.respond_to? :should
    page.should have_no_content(arg1)
  else
    assert page.has_no_content?(arg1)
  end
end

Given(/^I press "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  find('tr', text: arg2).click_button(arg1)
end

Given(/^I press the "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  find('tr', text: arg2).click_link(arg1)
end

Given(/^the following users exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  # express the regexp above with the code you wish you had
end

Given(/^I am a volunteer$/) do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)" link/  do |name|
  find_link(name).should_not be_nil
end












# Single-line step scoper
When /^(.*) within (.*[^:])$/ do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When (/^(?:|I )press "([^"]*)"$/) do |button|
  click_button(button)
end

When (/^(?:|I )follow "([^"]*)"$/) do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select or option
# based on naming conventions.
#
When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  check(field)
end

When /^(?:|I )uncheck "([^"]*)"$/ do |field|
  uncheck(field)
end

When /^(?:|I )choose "([^"]*)"$/ do |field|
  choose(field)
end

When /^(?:|I )attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end

Then /^(?:|I )should( not)? see "([^"]*)"$/ do |n, text|
  if page.respond_to? :should
    if n then page.should have_no_content(text) else page.should have_content(text) end
  else
    if n then assert page.has_no_content?(text) else assert page.has_content?(text) end
  end
end

Then /^the "([^"]*)" field should have the error "([^"]*)"$/ do |field, error_message|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')

  form_for_input = element.find(:xpath, 'ancestor::form[1]')
  using_formtastic = form_for_input[:class].include?('formtastic')
  error_class = using_formtastic ? 'error' : 'field_with_errors'

  if classes.respond_to? :should
    classes.should include(error_class)
  else
    assert classes.include?(error_class)
  end

  if page.respond_to?(:should)
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      error_paragraph.should have_content(error_message)
    else
      page.should have_content("#{field.titlecase} #{error_message}")
    end
  else
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      assert error_paragraph.has_content?(error_message)
    else
      assert page.has_content?("#{field.titlecase} #{error_message}")
    end
  end
end

Then /^the "([^"]*)" field should have no error$/ do |field|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')
  if classes.respond_to? :should
    classes.should_not include('field_with_errors')
    classes.should_not include('error')
  else
    assert !classes.include?('field_with_errors')
    assert !classes.include?('error')
  end
end

Then /^the "([^"]*)" checkbox(?: within (.*))? should be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within (.*))? should not be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_false
    else
      assert !field_checked
    end
  end
end
 
Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^(?:|I )should have the following query string:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')} 
  
  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end

Then /^show me the page$/ do
  save_and_open_page
end
