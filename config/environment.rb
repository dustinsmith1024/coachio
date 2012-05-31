# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Coachio::Application.initialize!
Time::DATE_FORMATS[:SHORT_DATE_AND_TIME] = "%a, %b %-d at %l:%m %P"
