require 'spec_helper'

describe Navlink do
  it { should validate_presence_of(:title) }
  it { should belong_to(:parent) }
  it { should validate_numericality_of(:parent_id, :allow_blank => true) }

end
