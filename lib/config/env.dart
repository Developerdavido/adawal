

import 'dart:convert';

enum EnvType {dev, main}
class Env {

  static EnvType defaultEnvType = EnvType.dev;
  static String baseUrl = "";
  static String projectId = "";


  ///This function will set the baseUrl and projectId according to the EnvType
  ///In this case we are using the Blockfrost APIs from our project that we created

  static getEnvType(EnvType type) {
    switch(type) {
      case EnvType.dev:
        baseUrl = "https://cardano-preprod.blockfrost.io/api/v0/";
        projectId = "preprodCnVciRsEyApKx3A2VLUldBVaGMciDmIN";
        break;
      default:
        baseUrl = "https://cardano-preprod.blockfrost.io/api/v0/";
        projectId = "preprodCnVciRsEyApKx3A2VLUldBVaGMciDmIN";
    }
  }
}