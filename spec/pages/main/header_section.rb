require 'site_prism'

class HeaderSection < SitePrism::Section

  # TODO search by text because there is no id/unique class
  element :for_members, :xpath, ".//a[text()='For Members']"

  def open_members_page
    for_members.click
    MembersPage.new
  end
end