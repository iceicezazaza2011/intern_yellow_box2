class VaultAccount{
    String? user;
    String? org;
    String? refreshToken;
    String? jwtToken;

    VaultAccount({this.user, this.org, this.refreshToken, this.jwtToken});

    factory VaultAccount.fromJson(Map<String, dynamic> json) {
        return VaultAccount(
            user: json['user'],
            org: json["org"],
            refreshToken: json['refreshToken'],
            jwtToken: json['jwtToken']
        );
    }

    Map<String, dynamic> toJson() => {
        'user' : user,
        'org' : org,
        'refreshToken' : refreshToken,
        'jwtToken' : jwtToken
    };
}