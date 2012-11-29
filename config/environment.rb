# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
InitialRelease::Application.initialize!

gem "activemerchant", :lib => "active_merchant", :version => "1.4.1"