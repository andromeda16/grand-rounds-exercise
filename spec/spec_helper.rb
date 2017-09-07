require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'yaml'
require 'site_prism'

# load config
config = YAML::load_file(File.join(File.dirname(__FILE__), '/config', 'config.yml'))

# env is taken from the Environmental variables, default: test
env = ENV['env'].to_s.empty? ? 'test' : ENV['env']

# loading page object files
page_paths = File.join(Dir.pwd, 'spec', 'pages', '**', '*.rb')
Dir[page_paths].each {|f| require f}

# register a new driver for Capybara
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :chrome
Capybara.app_host = config[env]['url']
Capybara.default_max_wait_time = config[env]['wait_time']


RSpec.configure do |conf|
  conf.before(:each) do
    conf.include Capybara::DSL
  end
end