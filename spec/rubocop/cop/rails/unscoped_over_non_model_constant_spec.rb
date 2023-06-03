# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::UnscopedOverNonModelConstant, :config do
  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `#User.where(trashed: true).unscoped`' do
    expect_offense(<<~RUBY)
      User.where(trashed: true).unscoped
                                ^^^^^^^^ Rails/UnscopedOverNonModelConstant: Prevent usage of `unscoped` over non model constants.
    RUBY
  end

  it 'does not register an offense when using `#User.unscoped`' do
    expect_no_offenses(<<~RUBY)
      User.unscoped
    RUBY
  end
end
