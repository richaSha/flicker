FactoryBot.define do
  factory(:user) do
    username('Richa')
    email_address('richa.shaurabh@gmail.com')
    password('richa123')
    password_confirmation('richa123')
  end

  factory(:image) do
    user
    name('test')
    photo { File.new("#{Rails.root}/spec/features/images/images1.jpeg")}
  end

end
