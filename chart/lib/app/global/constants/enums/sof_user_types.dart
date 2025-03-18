enum SofUserTypes {
  unregistered,
  registered,
  moderator,
  team_admin,
  does_not_exist,
}

extension SofUserTypesHelper on SofUserTypes {
  // check if the user is registered
  static bool isRegistered(String userType) {
    return userType == SofUserTypes.registered.name ||
        userType == SofUserTypes.moderator.name ||
        userType == SofUserTypes.team_admin.name;
  }
}
