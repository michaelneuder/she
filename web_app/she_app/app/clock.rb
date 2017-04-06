require 'clockwork'
include Clockwork

every(5.minutes, 'Send tweet'){
  `rake dm:get_dms`
}
