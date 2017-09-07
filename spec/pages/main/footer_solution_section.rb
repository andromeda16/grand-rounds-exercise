require 'site_prism'

class FooterSolutionSection < SitePrism::Section

  # TODO search by text because there is no id/unique class
  element :for_members, :xpath, ".//a[text()='For Members']"

end