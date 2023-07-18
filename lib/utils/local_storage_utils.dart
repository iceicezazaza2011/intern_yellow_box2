import 'dart:convert';

import 'package:intern_yellow_box/Domain/vault/vaultAccount.dart';
import 'package:intern_yellow_box/main.dart';

class LocalStorageUtils {
  Future<void> setVaultAccount(VaultAccount account) async {
    storage['vaultAccount'] = json.encode(account.toJson());
  }

  Future<VaultAccount?> getVaultAccount() async {
    if (storage['vaultAccount'] == null) {
      return null;
    }
    return VaultAccount.fromJson(json.decode(storage['vaultAccount']!));
  }
}
