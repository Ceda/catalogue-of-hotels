module ControllerMacros
  def login_admin
    before do
      @admin = Factory.create(:admin)
      sign_in @admin
    end
  end
end
