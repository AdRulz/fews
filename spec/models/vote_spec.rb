require 'spec_helper'

describe Vote do

  it "have client_id" do
    expect(subject).to have_attribute :client_id
  end

  it "belong to article" do
    expect(subject).to belong_to :article
  end

end
