require 'site_prism'
require 'pages/main/circle_chart_section'

class QualityThatCountsSection < SitePrism::Section

  sections :circle_charts,  CircleChartSection, :xpath, ".//div[contains(@class, 'circle-chart')]"
end