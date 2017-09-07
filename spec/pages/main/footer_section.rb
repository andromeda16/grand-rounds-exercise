require 'site_prism'
require 'pages/main/footer_solution_section'

class FooterSection < SitePrism::Section

  section :solutions, FooterSolutionSection, '.menu-footer-solutions-container'

  def open_members_page
    solutions.for_members.click
    MembersPage.new
  end
end