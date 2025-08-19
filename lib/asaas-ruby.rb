require 'awesome_print'
require 'active_support'
require 'active_support/inflector'
require 'rest-client'
require 'typhoeus'
require 'dry-types'
require 'dry-struct'
require 'asaas/version'
require 'asaas/types'
require 'virtus'
require 'json'

module Asaas
  autoload :Api, 'asaas/api'
  autoload :Client, 'asaas/client'
  autoload :Configuration, 'asaas/configuration'
  autoload :Entity, 'asaas/entity'

  autoload :Account, 'asaas/models/account'
  autoload :Customer, 'asaas/models/customer'
  autoload :Discount, 'asaas/models/discount'
  autoload :Fine, 'asaas/models/fine'
  autoload :Interest, 'asaas/models/interest'
  autoload :Model, 'asaas/models/model'
  autoload :Notification, 'asaas/models/notification'
  autoload :Payment, 'asaas/models/payment'
  autoload :Subscription, 'asaas/models/subscription'
  autoload :Transfer, 'asaas/models/transfer'
  autoload :Webhook, 'asaas/models/webhook'

  class << self
    def setup(&block)
      Asaas::Configuration.setup(&block)
    end
  end
end
