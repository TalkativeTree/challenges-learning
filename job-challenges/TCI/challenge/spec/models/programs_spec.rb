require 'spec_helper'

describe Programs do
  it { should ensure_length_of(:code).is_equal_to(6)}

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:subtitle) }
  it { should validate_presence_of(:code) }

  it { should allow_value("ABsIES").for(:title) }
  it { should allow_value("ABsIES").for(:subtitle) }
  it { should allow_value("ABsIES").for(:code) }

  it { should_not allow_value("&(*@").for(:title) }
  it { should_not allow_value(")@(#{}").for(:subtitle) }
  it { should_not allow_value("*&#}{").for(:code) }
  it { should_not allow_value("12345").for(:code)}
end
