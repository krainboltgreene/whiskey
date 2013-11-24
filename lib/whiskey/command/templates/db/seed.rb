# This is where you'll place any logic that boots up your instance from scratch

introduction = Document.create do |doc|
  doc.title = "Introduction"
  doc.body = """
    Welcome to <%= values.name.camelize %> a new MUTE!

    To make an account here simply type:

      account create a_suitable_username a_suitable_password

    To login to your account type:

      account access a_suitable_username a_suitable_password
  """
