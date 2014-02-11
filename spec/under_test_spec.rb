require 'spec_helper'
require_relative '../under_test'

describe UnderTest do
  describe '.some_method' do
    subject { described_class.some_method }

    before do
      class_double("Stubbed").as_stubbed_const
      class_double("Stubbed::SomeError").as_stubbed_const
      allow(Stubbed).to receive(:some_method).and_raise(Stubbed::SomeError)
    end

    it "raises the error" do
      expect(subject).to be_nil
    end
  end
end
