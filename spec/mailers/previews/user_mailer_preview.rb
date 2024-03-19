class UserMailerPreview < ActionMailer::Preview

 def welcome
  UserMailer.with(to: "admin@example.com", name: "dic").welcome
 end
end