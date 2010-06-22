require 'spec_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:author) }
  it { should have_one(:navlink) }

end
