# frozen_string_literal: true

require "bart/station"

describe Bart::Station do
  subject { described_class.new }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:abbreviation) }
end
