require 'site_prism'
require 'pages/main/header_section'
require 'pages/main/quality_that_counts_section'
require 'pages/main/footer_section'

class MainPage < SitePrism::Page
  set_url '/'
  set_url_matcher /grandrounds.com\/?/

  section :header, HeaderSection, '#fixed-top'
  # TODO no id or unique class for elements of the 'Get Quality That Counts' section
  section :quality_section, QualityThatCountsSection, :xpath, "(//h2[text()='Get Quality That Counts']//ancestor::div[@class='wpb_wrapper'])[1]"
  section :footer, FooterSection, '#footer'
end