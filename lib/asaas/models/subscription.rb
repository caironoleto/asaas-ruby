module Asaas
  class Subscription < Model
    BillingTypes = Types::Strict::String.enum('BOLETO', 'CREDIT_CARD', 'UNDEFINED', 'TRANSFER', 'DEPOSIT', 'PIX')
    Status = Types::Strict::String.enum('ACTIVE', 'EXPIRED', 'INACTIVE')
    Cycles = Types::Strict::String.enum('WEEKLY', 'BIWEEKLY', 'MONTHLY', 'BIMONTHLY', 'QUARTERLY', 'SEMIANNUALLY',
                                        'YEARLY')
    CreditCard = Types::Hash.schema({
                                      creditCardNumber: Types::Coercible::String,
                                      creditCardBrand: Types::Coercible::String,
                                      creditCardToken: Types::Coercible::String
                                    }).strict.with_key_transform(&:to_sym)
    Interest = Types::Hash.schema({
                                    value: Types::Coercible::Float,
                                    type: Types::Coercible::String
                                  }).strict.with_key_transform(&:to_sym)

    attribute :id, Types::Coercible::String.optional.default(nil)
    attribute :customer, Types::Coercible::String
    attribute :paymentLink, Types::Coercible::String.optional.default(nil)
    attribute :value, Types::Coercible::Float.optional.default(nil)
    attribute :dateCreated, Types::Params::Date.optional.default(nil)
    attribute :nextDueDate, Types::Params::Date.optional.default(nil)
    attribute :cycle, Cycles.optional.default(nil)
    attribute :description, Types::Coercible::String.optional.default(nil)
    attribute :billingType, BillingTypes.optional.default(nil)
    attribute :deleted, Types::Coercible::String.optional.default(nil)
    attribute :status, Status.optional.default(nil)
    attribute :externalReference, Types::Coercible::String.optional.default(nil)
    attribute :checkoutSession, Types::Coercible::String.optional.default(nil)
    attribute :creditCard, CreditCard.optional.default(nil)
    attribute :sendPaymentByPostalService, Types::Coercible::String.optional.default(nil)
    attribute :interest, Interest.optional.default(nil)
    attribute :split, Types::Coercible::String.optional.default(nil)
  end
end
