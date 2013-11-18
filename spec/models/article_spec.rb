require 'spec_helper'

describe Article do

  it "have a title" do
    expect( subject ).to respond_to :title
  end

  it "have a body" do
    expect( subject ).to respond_to :body
  end

  it "have a creaton date" do
    expect( subject ).to respond_to :created_at
  end

end
