require 'spec_helper'

describe Vote do

  it "belong to article" do
    expect(subject).to belong_to :article
  end

end
