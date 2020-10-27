# frozen_string_literal: true

# JSON API serialization for Hosts
class HostSerializer
  include FastJsonapi::ObjectSerializer
  set_type :host
  attributes :name, :os_major_version, :os_minor_version, :last_scanned,
             :rules_passed, :rules_failed
  attribute :compliant do |host|
    host.compliant.values.all?
  end

  has_many :test_results

  # rubocop:disable Style/SymbolProc
  has_many :profiles do |host|
    host.all_profiles
  end
  # rubocop:enable Style/SymbolProc
end
