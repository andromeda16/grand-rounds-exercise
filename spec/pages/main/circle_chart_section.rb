require 'site_prism'

class CircleChartSection < SitePrism::Section

  elements :bars, :xpath, './/div[@class=\'bar\']'
end