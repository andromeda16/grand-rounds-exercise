module JavascriptExecutor

  # Scrolls to an element
  # @element [SitePrism::ElementContainer]
  # @return [String]
  def scroll_to(element)
    script = <<-JS
      arguments[0].scrollIntoView(true);
    JS

    execute_js_script(script, element)
  end

  # Gets css property value for an element
  # @element [SitePrism::ElementContainer]
  # @prop_name [String], e.g. 'position'
  # @return [String]
  def get_css_property(element, prop_name)
    script = <<-JS
      return window.getComputedStyle(arguments[0]).getPropertyValue(arguments[1]);
    JS

    execute_js_script(script, element, prop_name)
  end

  # Returns element position attribute relative to the viewport
  # @element [SitePrism::ElementContainer]
  # @prop_name [String], e.g. 'top', 'left'
  # @return [String]
  def get_bounding_rect_property(element, prop_name)
    script = <<-JS
      return arguments[0].getBoundingClientRect()[arguments[1]];
    JS

    execute_js_script(script, element, prop_name)
  end

  # Executes JavaScript
  # @script [String] - JS script
  # @element [SitePrism::ElementContainer]
  # @return [String]
  private def execute_js_script(script, element, *args)
    Capybara.current_session.driver.browser.execute_script(script, element.root_element.native, *args)
  end
end